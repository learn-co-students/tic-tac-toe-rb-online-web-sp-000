require 'pry'

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Mid row
  [6,7,8], # Bottom row
  [0,3,6], #left col
  [1,4,7], # mid col
  [2,5,8], # Bottom col
  [0,4,8], # Left Diag 
  [2,4,6] # Right Diag 
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-" * 11  # instead of "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  11.times { print "-"} #or use a method to wright "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# move
def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def valid_move?(board, index)
  if index.between?(1,9)
    if !position_taken?(board, index)
      return true
    end
  end

index.between?(0,8) && !position_taken?(board, index)
end

#///////////////////////////////////////////////////
# Method for turn
def turn(board)
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    # player = current_player(board)
      if valid_move?(board, index)
        move(board, index, current_player(board))
        display_board(board)
      else
    turn(board)
  end
end

# binding.pry
def position_taken?(board, index)
  board[index] == 'X' || board[index] == 'O'
end

def turn_count(board)
  board.count {|player| player == 'X' || player == 'O'}
end

# Method for current players move
def current_player(board)
  turn_count(board).even? ? 'X' : 'O'
end


#///////////////////////////////////////////////////
def won?(board)
  WIN_COMBINATIONS.each do |index|
        if index.all? {|i| board[i]== "X"}
          return index
        elsif index.all? {|i| board[i]== "O"}
          return index
      end
    end
  nil
end

def full?(board)
    board.all? do |player|
    player == "X" || player == "O"
  end
end

def draw?(board)
!won?(board) && full?(board)  
end

def over?(board)
 won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

# Define your play method below
def play(board)
  # turn_num = 0
    until over?(board)
      turn(board)
      # turn_num += 1
    end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end