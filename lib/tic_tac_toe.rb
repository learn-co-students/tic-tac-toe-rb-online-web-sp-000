require "pry"

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, position, token)
  board[position] = token
end

def position_taken?(board, index)
  !(board[index] == "" || board[index] == " " || board[index] == nil)
end

def won?(board)
  WIN_COMBINATIONS.detect do |location|
    slot1 = location[0]
    slot2 = location[1]
    slot3 = location[2]

    board[slot1] == board[slot2] && board[slot2] == board[slot3] && board[slot1] != " "
  end
end

def full?(board)
  board.none? do |slot|
    slot == " "
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  if win_combination = won?(board)
    winning_location = win_combination[0]
    board[winning_location]
  end
end


def valid_move?(board, index)
  (index.between?(0,8) && !(position_taken?(board, index)))
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
      end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  #captures the user input.
  input = gets.strip
  index = input_to_index(input)
  token = current_player(board)
  if valid_move?(board, index) == true
    move(board, index, token)
    display_board(board)
  else
    puts "Invalid Entry"
    turn(board)
  end
end


def play(board)

  winner_is = current_player(board)
  count = 1
  turn(board) until over?(board)
#  until  over?(board) == true do
    #binding.pry
#    puts count
#    count +=1
#    turn(board)
#  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    return nil
  end

end
