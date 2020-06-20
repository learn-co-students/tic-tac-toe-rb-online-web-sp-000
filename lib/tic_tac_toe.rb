WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
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

def move(board, index, current_player)
board[index] = current_player
end

def valid_move?(board, index)
  if index.between?(1,9)
    if !position_taken?(board, index)
      true
    end
  end
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board [index] == nil)
    return false
  elsif (board[index] == "X") || (board[index] == "O")
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)

  end
end

# def turn(board)
#   current_player = "X"
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   if valid_move?(board, index)
#     move(board, index, current_player)
#     display_board(board)
#   else
#     turn(board)
#   end
# end

def turn_count(board)
    counter = 0
    board.each do |character|
    if character == "X" || character == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[1]] &&
    board[win[1]] == board[win[2]] &&
    position_taken?(board, win[0])
  end
end

def full?(board)
board.all? { |index| index == "X" || index == "O"  }
enddef draw?(board)
  full?(board) && !won?(board)
end
#
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    false
  end
end

def draw?(board)
  full?(board) && !won?(board)
end
# #
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    false
  end
end

def winner(board)
  if win_combination = won?(board)
  return  board[win_combination.first]
  end
end

def play(board)
  turn_count = 0
  while turn_count < 9
   turn(board)
   turn_count += 1
  end
end
#
# def valid_move?(board, index)
#   if index.between?(0,8)
#     if !position_taken?(board, index)
#       true
#     end
#   end
#
#   # position.to_i.between?(0,8) && !position_taken?(board, position.to_i-1)
# end
#
# def turn(board)
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   if valid_move?(board, index)
#     move(board, index)
#     display_board(board)
#   else
#     turn(board)
#   end
# end
#
# def position_taken?(board, index)
#   board[index] != " "
# end
#
# def move(board, index, current_player = "X")
#   board[index] = current_player
# end
#
#
# # def input_to_index(user_input)
# # converted_input = user_input.to_i - 1
# # end
# #
# # def move(board, index, current_player)
# #   board[index] = current_player
# # end
# #
# #
# # def position_taken?(board, index)
# #   !(board[index].nil? || board[index] == " ")
# # end
# #
# #
# # def valid_move?(board, index)
# # index.between?(0,8) && !position_taken?(board, index)
# # end
# #
# # def on_board?(num)
# #   if num.between?(0, 8) == true
# #     return true
# #   else
# #     return false
# #   end
# # end
# #     #
# #   #     if (position_taken?(board, index)) == false && (on_board?(index) == true)
# #   #       return true
# #   #     else
# #   #       return false
# #   #     end
# #   #   end
# #   # end
# #
# #   def turn(board)
# #   current_player = "X"
# #   puts "Please enter 1-9:"
# #   input = gets.strip
# #   index = input_to_index(input)
# #   if valid_move?(board, index)
# #     move(board, index, current_player)
# #     display_board(board)
# #   else
# #     turn(board)
# #   end
# # end
#
# def turn_count(board)
#     counter = 0
#     board.each do |character|
#
#     if character == "X" || character == "O"
#       counter += 1
#     end
#   end
#   counter
# end
#
# def current_player(board)
# # turn_count(board) % 2 == 0 ? "X" : "O"
# if turn_count(board) % 2 == 0
#     return "O"
#   else
#     return "X"
#   end
# end
#
# def won?(board)
#   WIN_COMBINATIONS.each do |win_combination|
#
#     win_index_1 = win_combination[0]
#     win_index_2 = win_combination[1]
#     win_index_3 = win_combination[2]
#
#     position_1 = board[win_index_1]
#     position_2 = board[win_index_2]
#     position_3 = board[win_index_3]
#
#     if position_1 == "X" && position_2 == "X" && position_3 == "X"
#         return win_combination
#     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
#       return win_combination
#     end
#   end
#   return false
# end
#
# def full?(board)
# board.all? { |index| index == "X" || index == "O"  }
# end
#
# def draw?(board)
#   if won?(board) == false && full?(board) == true
#     return true
#   else
#     return false
#   end
# end
#
# def over?(board)
#   if won?(board) || full?(board) || draw?(board)
#     return true
#   else
#     false
#   end
# end
#
# def winner(board)
#   if win_combination = won?(board)
#   return  board[win_combination.first]
#   end
# end
#
# def play(board)
#   counter = 0
# until counter == 9
#
#  turn(board)
# counter += 1
#
# end
# end
