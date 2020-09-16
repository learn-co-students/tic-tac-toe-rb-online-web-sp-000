WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #diagonal
  [2,4,6] #diagonal
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
 puts" #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts" #{board[3]} | #{board[4]} | #{board[5]} "
 puts "-----------"
 puts" #{board[6]} | #{board[7]} | #{board[8]} "
 end



def input_to_index(user_input)
  user_input.to_i-1
end

board = [" ", " ", " "]
def move(board, index, character)
  board[index] = character
end

move(board, 0, "X")

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
if index.between?(0, 8) && !position_taken?(board, index)
  return true
end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
   if valid_move?(board,index)
     move(board, index, current_player(board))
     display_board(board)
     else
       turn(board)
   end
end


def turn_count(board)
   counter = 0
   board.each do |players|
      if players == "X" || players == "O"
         counter += 1
      end
   end
   counter
end


def current_player(board)
   turn_count(board).even? ? "X" : "O"
end

def won?(board)
 WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]

   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]
if
   position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
return win_combination
  end
 end
 return false
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board)
    return false
  else
    won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   end
end

def play(board)
  until over?(board) || draw?(board)
    turn(board)
  end
  if won?(board)
    winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat\'s Game!"
  end
end
