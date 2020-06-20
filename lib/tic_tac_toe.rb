#Helper Methods

# WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

# Display board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Convert user input to index on board
def input_to_index(user_input)
  user_input.to_i - 1
end

# Player move
def move(board, index, current_player = "X")
  board[index] = current_player
end

# Position taken?
def position_taken?(board, position)
  !(board[position].nil? || board[position] == " " || board[position] == "")
end

# Is move valid?
def valid_move?(board, position)
  if position.to_i.between(1,9)
    if !position_taken?(board, position.to_i-1)
      true
    end
  end
end

# Completing a turn
def turn(board)
  puts "Please enter 1-9:"
end

# Number of turns taken
def turn_count(board)
  turns = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      turns += 1
    end
  end
  turns

# Figure out current player
def current_player(board)
  if turn_count(board) % 2 == 0
    puts "X"
  else
    puts "O"
end

#Is there a win?
def won?(board)
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

#Is the game a draw?
def draw?(board)
  !won?(board) && board.all?{|token| token == "X" || token == "O"}
end

#Is the board full?
def full?(board)
  board.all? {|position| position == "X" || position == "O"}
end

# Is the game over?
def over?(board)
  draw?(board) || won?(board)

#End of helper methods


# Play method
def play(board)
  turn_count = 0
  while turn_count < 9
    turn(board)
    turn_count+=1
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Aww too bad! No winner here."
  end
end
