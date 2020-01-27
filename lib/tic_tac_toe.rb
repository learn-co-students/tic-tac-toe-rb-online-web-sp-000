require 'pry'

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
  output = user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  # binding.pry
  #if user finds an empty space, it should return true
  #if user finds a space already used, it should return false
  if !position_taken?(board, index) && index.between?(0,8)
    return true
  else
    return false
  end
end

def turn(board)
  display_board(board)
  current_player = current_player(board)
  puts "Current Player: #{current_player}"
  puts "Please choose your next move: Spaces 1-9"
  # move = gets.strip
  space = input_to_index(gets.strip)
  if valid_move?(board, space)
    move(board, space, current_player)
    puts "\n\n"
    # hard coded to enter X each turn
  else
    puts "Invalid selection, please try again./n"
    turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each_with_index do |i, n|
    turn += 1 if position_taken?(board, n)
  end
  turn
end

def current_player(board)
  if turn_count(board).even?
    player = "X"
  else
    player = "O"
  end
end

def won?(board)
  is_won = false
  WIN_COMBINATIONS.each do |combo|
    position_1 = board[combo[0]]
    position_2 = board[combo[1]]
    position_3 = board[combo[2]]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      is_won = true
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      is_won = true
    end
  end
  is_won
end

def full?(board)
  if turn_count(board) == 9
    return true
  else
    return false
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      position_1 = board[combo[0]]
      position_2 = board[combo[1]]
      position_3 = board[combo[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        winner = "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        winner = "O"
      end
    end
    return winner
  end
end

def play(board)
  puts "Welcome to Tic Tac Toe!"
  while !over?(board)
    turn(board)
  end

  if draw?(board)
    puts "Sorry, but that's a Draw!"
    puts "Cat's Game!"
  else
    puts "The winner is Player #{winner(board)}!"
    puts "Congratulations #{winner(board)}!"
  end
end
