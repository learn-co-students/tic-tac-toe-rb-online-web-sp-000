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

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def move(board, index, player )
  board[index] = player
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) 
    move(board, index, current_player(board)) 
    display_board(board)
  else
    turn(board)
  end
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
   if turn == "X" || turn == "O"
    counter += 1
    end
  end
  return counter
end

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    win1=combination[0]
    win2=combination[1]
    win3=combination[2]
    # looping and saving first 3 numbers in each array to variables using [indexes]
    board[win1] == board[win2] && board[win2] == board[win3] && board[win1] != " "
    # using variables with board array numbers (winning numb) to check if they match
  end  
end

def full?(board)
  board.none? {|i| i==" " }
end

def draw?(board)
  !won?(board) && full?(board) 
end

def over?(board)
  if won?(board) 
    return true
    elsif draw?(board)
      return true
      elsif full?(board)
        return true
  end
end

def winner(board)
  win_combination=won?(board)
  if win_combination
    winning_location=win_combination[0]
    board[winning_location]
  else
    nil
  end
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

