def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,5,8],
  [7,4,1],
  [0,3,6],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  hold_array = []

  WIN_COMBINATIONS.each do |combo|
    combo.each do |index|
    hold_array << board[index] if position_taken?(board, index)
  end
  if hold_array.length == 3 && hold_array.uniq.length == 1
    return combo
  else
    hold_array.clear
  end
end
  false
end

def full?(board)
  board.all? { |pos| pos == "X" || pos == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  return true if won?(board)
  return true if draw?(board)
end

def winner(board)
  hold_array = []

  WIN_COMBINATIONS.each do |combo|
    combo.each do |index|
      hold_array << board[index] if position_taken?(board, index)
    end
    if hold_array.length == 3 && hold_array.uniq.length == 1
      winner = hold_array.uniq.first
      return winner
    else
      hold_array.clear
    end
  end
  nil
end

def position_taken?(board, index)
  if board[index] == " " || board [index] == "" || board[index].nil?
    return false
  else
    return true
  end
end

def turn_count(board)
  count = 0
  board.each do |pos|
    count += 1 unless pos == " "
  end
  count
end

def current_player(board)
  count = turn_count(board)
  return "X" if count.even?
  return "O" if count.odd?
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  if index.to_i.between?(0, 8)
    return true if board[index] == " "
  end
  return false
end

def input_to_index(input)
  int = input.to_i
  int - 1
end

def move(board, index, char = "X")
  board[index] = character
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  token = current_player(board)
  unless valid_move?(board, index)
    turn(board)
  else
    player_move(board, index, token)
    display_board(board)
  end
end

  def player_move(board, index, token)
    board[index] = token
  end

def play(board)
  until over?(board) || won?(board)
    turn(board)
  end
  puts "Cat's Game!" if draw?(board)
  puts "Congratulations X!" if winner(board) == "X"
  puts "Congratulations O!" if winner(board) == "O"
end
