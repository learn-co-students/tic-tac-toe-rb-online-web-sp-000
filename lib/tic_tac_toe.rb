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

board = [" "," "," "," "," "," "," "," "," "]

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


def position_taken?(board, index)
 if board[index] == " " || board[index] == ""
   return false
 elsif board[index] == nil
   return false
 elsif board[index] == "X" || "O"
   return true
else return nil
 end
end


def valid_move?(board, index)
  if !position_taken?(board, index) && index >= 0 && index <= 8
    return true
  else
    return false
  end
end


def move(board, index, value)
  board[index] = value
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    puts "Please enter a valid number"
    turn(board)
  end

  display_board(board)
end

def turn_count(board)
  counter = 0
board.each do |turn|
  if turn == "X"
    counter +=1
  elsif turn == "O"
    counter +=1
  else counter += 0
end
end
turn_count = counter
end

def current_player(board)
  if turn_count(board).odd?
    return "O"
  elsif turn_count(board).even?
    return "X"
  end
  end

  def won?(board)
    WIN_COMBINATIONS.detect do |wincombo|
      board[wincombo[0]] == board[wincombo[1]] &&
      board[wincombo[1]] == board[wincombo[2]] &&
      position_taken?(board, wincombo[0])
    end

  end

  def full?(board)
    board.uniq == ['X', 'O']
  end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do |wincombo|
    position_one = board[wincombo[0]]
    position_two = board[wincombo[1]]
    position_three = board[wincombo[2]]

    all_positions_same = [position_one, position_two, position_three].uniq.length == 1

    if all_positions_same && position_taken?(board, wincombo[0])
      return position_one
    end
  end
  return nil
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
