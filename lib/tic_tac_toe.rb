require "pry"

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [2,5,8],
    [1,4,7]
  ]

  def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player(board)
end

def position_taken?(board, location)
  board[location] != " "
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
  else turn(board)
  end
end

def play(board)
  until over?(board)
    turn(board)
    end
    if won?(board)
    puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
    puts "Cat's Game!"
  end
end

def turn_count(board)
  board.count {|move| move == "O" || move == "X"}
  #counter = 0
  #board.each do |move|
    #if move == "X" || move == "O"
      #counter +=1
    #end
  #end
#counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
WIN_COMBINATIONS.find {|combo| board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "}
end

def full?(board)
  board.all? {|position| position != " "}
end

def draw?(board)
  if full?(board) && !(won?(board))
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
if won?(board)
   board[won?(board)[0]]
else
  nil
  end
end
