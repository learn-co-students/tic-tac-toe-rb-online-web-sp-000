require "pry"

#///////////////////////////////GAME PLAY METHODS//////////////////////////
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

def move(board, index, token)
  board[index] = token
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  token = current_player(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  # binding.pry
  if won?(board)
    # binding.pry
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

def turn_count(board)
  count = 0
  board.each do |index|
    # binding.pry
    if index != " " && index != nil
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end
#////////////////////END GAME PLAY///////////////////////////////////////

#////////////////////GAME STATUS METHODS/////////////////////////////////
def position_taken?(board, index)
  # binding.pry
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #down diagonal
  [2,4,6], #up diagonal
  [0,3,6], #first column
  [1,4,7], #middle column
  [2,5,8]  #right column
]

def won?(board)
#   win =
#   WIN_COMBINATIONS.find do |win_combo|
#     win_combo.all? {|index| board[index] == "O"}
#   end
# # binding.pry
#   if win  == nil || win == false
#     win =
#     WIN_COMBINATIONS.find do |win_combo|
#       win_combo.all? {|index| board[index] == "X"}
#     end
#   end
# # binding.pry
#   if win == nil
#     win = false
#   end
# # binding.pry
# win

  # WIN_COMBINATIONS.find do |win_combo|
  #   win_combo.all? {|index| board[index] == "O"} ||
  #   win_combo.all? {|index| board[index] == "X"}
  # end

  WIN_COMBINATIONS.find do |win_combo|
    position_taken?(board, win_combo[0])  &&
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]]
  end
end

def full?(board)
  board.all? {|index| !index.nil? && index != " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  # binding.pry
  won?(board) || draw?(board)
end

def winner(board)
  # binding.pry
  if over?(board)
    board[won?(board)[0]]
  end
end
# /////////////////////END GAME STATUS METHODS///////////////////////////////////
