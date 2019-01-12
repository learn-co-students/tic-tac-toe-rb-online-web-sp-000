

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  return input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if  board[index] != "X" && board[index] != "O"
      return false
  else
      board[index] == "X" && board[index] == "O"
      return true
  end
end

def valid_move?(board, index)
   if position_taken?(board, index) == false && index.between?(0, 8)
      return true
   else
      position_taken?(board, index) == true
      return false
  end
  end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  value = current_player(board)
  if valid_move?(board, index)
       move(board, index, value)
       display_board(board)
     else
       puts "Wrong entry."
       turn(board)
     end
     end

def turn_count(board)
     board.count do |v|
       v == "X" || v == "O"
     end
end

def current_player(board)
  if turn_count(board) % 2 == 0
     return "X"
  else
     return "O"
  end
end

def won?(board)

  WIN_COMBINATIONS.each do |f|
  index0 = f[0]
  index1 = f[1]
  index2 = f[2]


  position0 = board[index0]
  position1 = board[index1]
  position2 = board[index2]

  if position0 == "X"  && position1 == "X" && position2 == "X"  ||
     position0 == "O"  && position1 == "O" && position2 == "O"

  return f
  end
end
  return false
end

def full?(board)
 board.all? do |y|
   y == "X" || y == "O"
 end
end


def draw?(board)
 full?(board) == true && won?(board) == false
end

def over?(board)
won?(board) || draw?(board)
end


def winner(board)
  if  over?(board)  || draw?(board)
      board[won?(board)[0]]
    else
      print
    end
  end


def play(board)
  until over?(board)
    turn(board)
    draw?(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
