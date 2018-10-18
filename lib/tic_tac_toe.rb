WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
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

def turn_count(board)
#This method takes in an argument of the board array and returns the number of turns that have been played.
  counter = 0
  board.each do |position|
    if position != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  winner = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|idx| board[idx] == "X"}
      winner = combo
    elsif combo.all? {|idx| board[idx] == "O"}
      winner = combo
    else
      false
    end
  end
  if winner != nil
    winner
  else
    false
  end
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)

  if full?(board)
    if won?(board) == false
      true
    else
      false
    end
  else
    false
  end
end

def over?(board)
  if won?(board) == false && draw?(board) == false
    false
  else
    true
  end
end

def winner(board)
  win = won?(board)

  if win == nil || win == false
    return nil
  elsif win.all? {|idx| board[idx] == "X"}
    return "X"
  elsif win.all? {|idx| board[idx] == "O"}
    return "O"
  end
end

def play(board)

  until over?(board) == true
    turn(board)
  end

  if winner(board) == "X"
    puts "Congratulations X!"

  elsif winner(board) == "O"
    puts "Congratulations O!"

  elsif draw?(board) == true
    puts "Cat's Game!"
  end

end
