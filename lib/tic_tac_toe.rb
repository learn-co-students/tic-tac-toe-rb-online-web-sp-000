#final lab for tic tac toe in Ruby

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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

def display_board (board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

puts display_board(board)

def input_to_index (user_input)
user_input.to_i - 1
end

def move(board,index,character)
  board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# code your #valid_move? method here
def valid_move?(board, index)
       index.between?(0, 8) && !(board[index] == 'X' || board[index] == 'O')

end

#turn

def turn_count (board)
  counter = 0
  board.each do |turn|
    if turn == "X"
      counter += 1
      end
    if turn == "O"
      counter += 1
      end
  end
return counter
  end

def current_player(board)
    counter = turn_count(board)
    who_turn = counter % 2 == 0? "X" : "O"
    return who_turn
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
    see_pos_1= board[win[0]]
    see_pos_2= board[win[1]]
    see_pos_3= board[win[2]]

    if (see_pos_1 == "X" && see_pos_2 == "X" && see_pos_3 == "X") || (see_pos_1 == "O" && see_pos_2 == "O" && see_pos_3 == "O")
      return win
    end
  end
   false
  end


def full?(board)
  board.all? do |space|
  space != " "
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  end
end

def over?(board)
 draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  until over?(board)
    turn (board)
  end
    if draw?(board)
      puts "Cat's Game!"
    elsif
      winner(board) == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end

end
