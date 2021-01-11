# Define your WIN_COMBINATIONS constant
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

def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1 #converts to integer and subtracts 1
end

def move(array, index, value)
  array[index] = value
end

def valid_move?(board, index)
  index >= 0 && index <= 8 && (board[index] == " " || board[index] == "" || board[index] == nil)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your play method below
def turn_count(board)
  board.count{|i| (i == "X")||(i == "O")}
end

def current_player(board)
  odd_or_even = turn_count(board) % 2 #determines odd or even
  odd_or_even == 0 ? player = "X" : player = "O" #determines which player's turn it is
  player #returns current player "X" or "O"
end

#board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
def turn(board)
  value = current_player(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, value)
    display_board(board)
  else
    turn(board)
  end
end
#turn(board)

def won?(board)
  num_winning_combos = WIN_COMBINATIONS.count #determines count of the number of winning combinations

# Look at the board for "X" and "O" in the winning combination indexes
  (num_winning_combos).times {|i|
      win_combo = [""]

      # if all values equal X return true
      all_X = WIN_COMBINATIONS[i].all? do |j|
        board[j] == "X"
      end

      # if all values euql O return true
      all_O = WIN_COMBINATIONS[i].all? do |n|
        board[n] == "O"
      end

      # if all_X or all_O true then return winning combination
      if (all_X == true || all_O == true)
        status = WIN_COMBINATIONS[i]
        #puts "#{status}"
        return status
      end

  }
false #returns false if no winning combination found
end

def full?(board)
 board.all?{|i| (i == "X") || (i == "O")} #? false : true #If no blank spaces are found return true
end

def draw?(board)
  won?(board) == false && full?(board) == true #if no winning combination found and the board is full, return true
end

def over?(board)
  draw?(board) || won?(board) #if there is a draw or a winner then return true
end


def winner(board)
  who_winner = won?(board) #determines which rows the board was won in
  if who_winner != false
    board[who_winner[0]] #searches the 1st value of the winning index to see who the winner was
  else
    nil
  end
end

#board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
def play(board)
  while over?(board) == false
    turn(board)
    over?(board)
    #puts "#{board}"
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
  end
end
#puts "#{play(board)}"
#lay(board)
