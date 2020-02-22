
#win_combinations
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
]

#display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input_to_index 
def input_to_index(user_input)
  user_input.to_i - 1 
end 

#move
def move(board, index, current_player)
  board[index] = current_player
end

#position_taken?
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#valid_move
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index) 
end

#turn 
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

#turn_count
def turn_count(value)
  count = 0 
  value.each do |turn|
    if turn == "X" || turn == "O"
      count += 1 
    end
  end
  return count 
end

#current_player
def current_player(board)
  count = turn_count(board)
  if count == 0 || count % 2 == 0 
    return "X"
  else
    return "O"
  end 
end

#won?
def won?(board)
end 

#full?
def full?(board)
  board.all?{|move| move = "X" || move = nil}
end

#draw?
def draw?(board)
  if !won?(board) && full?(board)
    return true 
    elsif !won?(board) && !full?(board)
    return true 
  else won?(board)
    return false 
  end
end

#over?
def over?(board)
end

#winner?
def winner?(board)
  winner = won?(baord)
  if winner.first == 0 || winner.first == 1 || winner.first ==2 ||winner.first ==3 || winner.first == 6
    board[winner.first]
  else winner = false
    return nil
  end
end

#play 
def play(board)
  
end








  