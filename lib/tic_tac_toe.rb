WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8], #rows
  [0,3,6],[1,4,7],[2,5,8], #cols
  [0,4,8],[2,4,6]          #diagonals
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
      if board[combo[0]] != " " && board[combo[0]] != ""
        return combo
      end
    end
  end
  return nil
end

def full?(board)
  board.each do |space|
    if space == " " || space == ""
      return false
    end
  end
  return true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  return false
end

def over?(board)
  return draw?(board) || won?(board) ? true : false
end

def winner(board)

  if won?(board) != nil
    win_combo = won?(board)
    return board[win_combo[0]]
  end
return nil
end

def turn_count(board)
  current_turn = 0
  board.each do |space|
    space != " " && space != "" ? current_turn +=1 : current_turn
  end
  return current_turn
end

def current_player(board)
  turn_count(board) % 2 == 1 ? "O" : "X"
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  turns = 0
  while turns < 9 do
    if over?(board)
      if won?(board)
        puts "Congratulations #{winner(board)}!"
        return
      else draw?(board)
        puts "Cat's Game!"
        return
      end
    end

    turn(board)
    turns += 1
  end
end
