
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(position)
  position = position.to_i
  position = position - 1
end

def move(new_board, index, player)
  new_board[index] = player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if ((position_taken?(board, index) == false) && (index.between?(0,8) == true))
    return true
  else
    return false
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
  count = 0
  board.each do |board_i|
    if board_i == "X" || board_i == "O"
      count += 1
    else
      count += 0
    end
  end
  return count
end

def current_player(board)
  moves_count = turn_count(board)
  if (moves_count % 2) == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    position_taken?(board, combination[0]) == true &&
    board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] 
  end    
end


def full?(board)
  board.all? do |board_index|
    board_index == "X" || board_index == "O" 
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

