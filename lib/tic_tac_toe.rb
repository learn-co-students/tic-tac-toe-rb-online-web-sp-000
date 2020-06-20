require 'pry'

WIN_COMBINATIONS = [
[0,1,2], # top_row
[3,4,5], # middle_row
[6,7,8], # bottom_row
[0,3,6], # left_column
[1,4,7], # center_column
[2,5,8], # right_column
[0,4,8], # left_diagonal
[6,4,2] # right_diagonal
]

board = "board"
board = [" "," "," "," "," "," "," "," "," ",]
puts "Welcome to Tic Tac Toe!"

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  new_user_input = user_input.to_i
    new_user_input -= 1
    return new_user_input
end

def move(board, index, token)
  board[index] = token

  return board

end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0, 8) && !(position_taken?(board, index))
end




def turn(board)
  #puts "Please enter 1-9:"
  #get the user input
  user_input = gets.strip
  #input to index
  index = input_to_index(user_input)
  token = current_player(board)

  #check for validation
  if valid_move?(board,index)
    puts 'valid move'
    move(board, index, token)
    display_board(board)
   else
    puts 'try again'
    turn(board)
  end
  display_board(board)
end





def won?(board)
  winner = nil
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def turn_count(board)
  a = 0
  board.each do |spaces|
    if spaces == "X" || spaces == "O"
      a += 1
    end
  end
  a
end

def current_player(board)
  turn_count(board) % 2 == 0? "X" : "O"
end

def full?(board)
   board.all? {|i| i == "X" || i == "O"}
end

# def draw?(board)
#   if full?(board)
#   else won?(board) == false
#       return true
#     end
#   elsif won?(board) == true
#     true
#   end
# end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end




def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  end
end



def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

# Define your play method below

# def play(board)
# puts "Plese enter 1-9"
# move_count = []
#   turn.each do |spaces|
#     if spaces == "X" || spaces == "O"
#    move_count.push(1)
#     end
#   end
# move_count.length.to_i
# end
# def play(board)
# counter = 0
#   while counter < 9
#   puts "next turn"
#   turn(board)
#
#   end
#   counter += 1
#
#
# end

# def play(board)
#
#   until over?(board) == true || won?(board) != false
#   puts 'turn'
#     turn(board)
#   end
#   if winner(board)
#     puts "Omedatou!!"
#   elsif draw?(board)
#     puts "Cats game!"
#   else
#     return nil
#   end
# end

def play(board)
   until over?(board)
      turn(board)
   end
   if won?(board)
      winner(board) == "X" || winner(board) == "O"
      puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
      puts "Cat's Game!"
   end
end
