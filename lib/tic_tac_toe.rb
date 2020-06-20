WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[2,4,6]
]

board = [" "," "," "," "," "," "," "," "," "]

  def display_board(board)
  puts" #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player

end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"

     return true
   else
return false
end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  else
    return false
  end
end

def turn(board)
   puts "Please enter a number 1-9:"
   input = gets.strip
   index = input_to_index(input)

    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

def turn_count(board)
  turn = 0
  board.each do |token|
    if token == "X" || token == "O"
    turn += 1
  end
end
turn
end

def current_player(board)
  if turn_count(board) % 2 != 0
    return "O"
  elsif turn_count(board) % 2 == 0
    return "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[2]] ==
    board[combo[1]] && position_taken?(board,combo[0])
    #return combo
  end
  #false
  end
#end

def full?(board)
  board.each do |token|
    if token == " "
      return false
    end
end
   true

  end



def draw?(board)
  if full?(board) == true && !won?(board)
    return true
  else
    return false
  end
end
#end
def over?(board)
  if draw?(board) == true || full?(board) == true || !!won?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
  win_combo = won?(board)
  return board[win_combo[0]]
  end
nil
end

def play(board)

  until over?(board)
    turn(board)
  end
  if winner(board)
     true
      puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
     true
    puts "Cat's Game!"
  end
end
