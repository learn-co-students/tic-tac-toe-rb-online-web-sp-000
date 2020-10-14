#Win combination Arrarys
require "pry"


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

def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end


# display_board
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
def position_taken?(board, position)
  board[position] != " " && board[position] != ""
end

#valid_move?
def valid_move?(board, position)
  position.between?(0,8) && !position_taken?(board, position)
end

# def valid_move?(board,position)
#   if !position_taken?(board, position) && position.between?(0,8)
#     return true
#   else
#     return false
#   end
# end

# turn method
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    #  puts "Please enter X or O"
    #  xo = gets.strip
     puts "The move is valid"
     move(board,index,current_player(board))
     display_board(board)
   else
     puts "Input invalid and provide valid location"
     turn(board)
   end
end

#turn_count
def turn_count(board)
  counter = 0
  board.each do |play|
    if play != " "
      counter += 1
    end
    #binding.pry
    # counter
  end
  counter
end

#current_player
def current_player(board)
  turn_count(board).even? ? 'X' : 'O'
  # binding.pry
end

# def current_player(board)
#  # if turn_count(board) % 2 == 0
#    #   binding.pry
#    #   return "X"
#    # else
#    #   return "O"
#  # end
#    turncount = turn_count(board)
#    turncount % 2 == 0 ? "X" : "O"
# end




#Won?,full?,Draw?,over?,winner method

def won?(board)
  # binding.pry
    check = false
    WIN_COMBINATIONS.each do |win_combination|
        first_index = win_combination[0]
        second_index = win_combination[1]
        third_index = win_combination[2]

        position_1 = board[first_index]
        position_2 = board[second_index]
        position_3 = board[third_index]

       if (position_1 == "X"  && position_2 == "X" && position_3 == "X") ||
          (position_1 == "O"  && position_2 == "O" && position_3 == "O")
          return win_combination
          check = true
       end
    end
  check
end


def full?(board)
  board.none?{|mark| mark == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if win_array = won?(board)
    board[win_array.first]
  end
end


def play(board)
  turn(board) until over?(board)
  puts "over?(board)"
  if won?(board)
   puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
  # binding.pry
end
