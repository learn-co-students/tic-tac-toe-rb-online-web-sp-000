WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input = input.to_i
  input-1
end

def move(board,index,character)
  board[index]="#{character}"
  board
end

def position_taken?(board, position)
  board[position] != " "
end

def good_number(index)
  index>=0 && index<=8
end


def valid_move?(board, position)
  good_number(position) && !(position_taken?(board, position))
end

def turn_count(board)
  number_of_blanks = 0
  board.each do |element|
    if element == " "
      number_of_blanks+=1
    end
  end
  9-number_of_blanks
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def turn(board)
    puts "Please enter a number 1-9:"
    spot = input_to_index(gets)
    character = current_player(board)
  until valid_move?(board,spot)
    puts "Please enter a number 1-9:"
    spot = input_to_index(gets)
  end
  move(board, spot, character)
end


def X_win?(board) WIN_COMBINATIONS.select do |winning_combination|
    winning_combination.all? do |value|
      board[value]=="X"
    end
  end[0]
end

def O_win?(board) WIN_COMBINATIONS.select do |winning_combination|
    winning_combination.all? do |value|
      board[value]=="O"
    end
  end[0]
end

def won?(board)

if X_win?(board) == nil && O_win?(board) == nil
  nil
elsif X_win?(board) == nil
  O_win?(board)
else
  X_win?(board)
end

end

def full?(board)
  board.none? {|letter| letter==" "}
end

def empty_spots?(board)
  !full?(board)
end

def draw?(board)
  if won?(board)
    false
  elsif empty_spots?(board)
    false
  else
    true
  end
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if X_win?(board)
    "X"
  elsif O_win?(board)
    "O"
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
