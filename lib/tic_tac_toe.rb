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
  if valid_move?(board, index)
    current_player = current_player(board)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |position|
    if position != "" && position != " "
      count += 1
    end
  end
  count
end

def current_player(board)
  turn_number = turn_count(board)
  if turn_number % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_combo = []
    win_combination.each do |index_value|
      if position_taken?(board, index_value) == true
        win_combo << index_value
      end
    end
    if win_combo.length == 3
      if board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]]
        return win_combo
      end
    end
  end
  return false
end

def full?(board)
  count = 0
  board.each do |position|
    if position == "X" || position == "O"
      count += 1
    end
  end
  if count == 9
    true
  else
    false
  end
end

def draw?(board)
  if full?(board)
    if won?(board)
      false
    else
      true
    end
  else
    if won?(board)
      false
    end
  end
end

def over?(board)
  if full?(board) === true || won?(board) != false || draw?(board) === true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    win_combo = won?(board)
    board[win_combo[0]]
  else
    nil
  end
end

def play(board)
  game_board = board
  until over?(game_board) == true
    turn(game_board)
    won?(game_board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
