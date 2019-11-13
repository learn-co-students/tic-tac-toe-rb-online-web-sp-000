
WIN_COMBINATIONS=[[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

def display_board(board)
rows = [" #{board[0]} | #{board[1]} | #{board[2]} ", "-----------", " #{board[3]} | #{board[4]} | #{board[5]} ", "-----------", " #{board[6]} | #{board[7]} | #{board[8]} ",]
puts rows
end

def input_to_index(input)
  value = input.to_i
  user_position_request = value-1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index > 8 || index < 0 || position_taken?(board, index)
    false
  else
    true
  end
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

def turn_count(board)
  board.join.gsub(" ","").length
end

def current_player(board)
  if turn_count(board).odd?
    "O"
  else
    "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |indexes|
    board[indexes[0]] == board[indexes[1]] && board[indexes[1]] == board[indexes[2]] && position_taken?(board, indexes[0])
  end
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end

def play(board)
  turn(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
  end
end
