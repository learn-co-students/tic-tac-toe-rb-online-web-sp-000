  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
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

def move(array, index, value)
  array[index] = value
  return array
end



def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else true
  end
end


def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    true
  else false
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0 || turn_count(board) == 0
    return "X"
  else 
    return "O"
  end
end




def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
   display_board(board)
   else turn(board)
  end
end


def won?(board)
    WIN_COMBINATIONS.any? do |winner|
      win_index_1 = winner[0]
      win_index_2 = winner[1]
      win_index_3 = winner[2]
      
      win_1 = board[win_index_1]
      win_2 = board[win_index_2]
      win_3 = board[win_index_3]
      
      if win_1 == "X" && win_2 == "X" && win_3 == "X"
        return winner
      elsif win_1 == "O" && win_2 == "O" && win_3 == "O"
        return winner
      else
        false
      end
    end
  end
  
  
def full?(board)
  if board.include?(" ") == true
    false
  else
    true
  end
end


def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else false
  end
end


def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    true
  else
    false
  end
end


def winner(board)
  win = won?(board)
  if win
    return board[win[0]]
  else
    nil
  end
end
  
  
  
def play(board)
  until over?(board) == true
  turn(board)
  play(board)
end
if draw?(board) == true
  puts "Cat's Game!"
end
  if won?(board) != false
  puts "Congratulations #{winner(board)}!"
end
end