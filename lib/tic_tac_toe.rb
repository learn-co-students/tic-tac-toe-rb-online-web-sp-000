WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [2,4,6]  # Right diagonal
]


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

def move(board,input,current_player)
  board[input] = current_player
end

def position_taken?(board,index)
  if board[index] == " "
    false
  elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board,index)
  if  index<8 && index>=0 && position_taken?(board,index) == false
    return true
  else
    return false

  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  input = input_to_index(input)
  if valid_move?(board, input)
    move(board,input,char='X')
  else
    "Please submit another input"
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  turn_counter = 0
  board.each do |position|
    if position != " " && position != ""
      turn_counter += 1
    end
    end
    return turn_counter
  end

def current_player(board)
  if turn_count(board)%2 == 0
    return "X"
  else
    return "O"
  end
end

def xwin(array)
  array.all? {|k| k == "X" }
end

def owin(array)
  array.all? {|k| k == "O" }
end

def full?(board)
  board.none? {|k| k == " " }
end

def won?(board)
  WIN_COMBINATIONS.each do |i|
    won = []
    i.each do |j|
      won << board[j]
    end
    if xwin(won)
      return i
    elsif owin(won)
      return i
    end
    end
  return false
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do |i|
    won = []
    i.each do |j|
      won << board[j]
    end
    if xwin(won)
      return "X"
    elsif owin(won)
      return "O"
      end
      end
    return nil
end
