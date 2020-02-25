
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
  if board[0] == "X" && board[1] == "X" && board[2] == "X"
    [0, 1, 2]
  elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
    [3,4,5]
  elsif board[6] == "X" && board[7] == "X" && board[8] == "X"
    [6,7,8]
  elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
    [0,3,6]
  elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
    [1,4,7]
  elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
    [2,5,8]
  elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
    [0,4,8]
  elsif board[2] == "X" && board[4] == "X" && board[6] == "X"
    [2,4,6]
  elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
    [0,1,2]
  elsif board[3] == "O" && board[4] == "O" && board[5] == "O"
    [3,4,5]
  elsif board[6] == "O" && board[7] == "O" && board[8] == "O"
    [6,7,8]
  elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
    [0,3,6]
  elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
    [1,4,7]
  elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
    [2,5,8]
  elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
    [0,4,8]
  elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
    [2,4,6]
  else
    false 
  end
end

#full?
def full?(board)
  board.all?{|move| move = "X" || move = "O"}
end

#draw?
def draw?(board)
  won?(board) == false && full?(board) == true 
end

#over?
def over?(board)
  won?(board) != false || draw?(board) == true || full?(baord) == true
end

#winner
def winner(board)
  if won?(board).any? {|win| 
      win = WIN_COMBINATIONS[0] || 
      win = WIN_COMBINATIONS[1] ||
      win = WIN_COMBINATIONS[2] ||
      win = WIN_COMBINATIONS[3] ||
      win = WIN_COMBINATIONS[4] ||
      win = WIN_COMBINATIONS[5] ||
      win = WIN_COMBINATIONS[6] ||
      win = WIN_COMBINATIONS[7] ||
      win = WIN_COMBINATIONS[8] ||
  }
      winner = won?(board).first
      return winner
    else 
      return nil
    end 
end

#turn 
def turn(board)
end

#play 
def play(board)
end