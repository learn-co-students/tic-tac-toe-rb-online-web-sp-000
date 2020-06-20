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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count (board)
  counter = 0
  board.each do |location|
    if location != " " && location != ""
      counter += 1
    end
  end
  counter
end

def current_player (board)
  count = turn_count(board)
  if count % 2 == 0
    player = "X"
  else
    player = "O"
  end
  player
end
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  current_player = current_player(board)
  if valid_move?(board, index)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

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
#determines if a win
def won? (board)
  WIN_COMBINATIONS.each do |combo|
    #creates an array to test with #all?
    posit = [" ", " ", " "]
    counter = 0
    #starts loop to test posit
    combo.each do |windex|
    posit[counter] = board [windex]
    counter +=1
    #tests for full array
      if posit.all? {|var| var == "X"}
        return combo
      elsif posit.all? {|var| var == "O"}
        return combo
      end
    end
  end
  return false
end

#test if the board is full
def full? (board)
  #if there is a blank space, returns false, otherwise true
  !(board.detect {|posit| posit == " "})
end
  
#test if there is a draw
def draw? (board)
  if full?(board) == true
    !won?(board)
  end
end

#test if game is over
def over? (board)
  if draw? (board)
    return true
  elsif won? (board)
    return true
  end
end

#returns the winner
def winner (board)
  if won?(board)
    winrow = won?(board)
    posit = [" ", " ", " "]
    counter = 0
    winrow.each do |windex|
      posit[counter] = board[windex]
      counter += 1
    end
    if posit.all? {|var| var == "X"}
      return "X"
    elsif posit.all? {|var| var == "O"}
      return "O"
    end
  end
end

def play (board)
  until over?(board)==true
    turn (board)
  end
  if won?(board)
    win_player = winner(board)
    puts "Congratulations #{win_player}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end