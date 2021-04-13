require "pry"

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

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn_count(board)
  board.select { |position| position == "X" || position == "O" }.size
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
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

def won?(board)
  win_combo = []
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
      win_combo = combo
    end
  end
    win_combo.empty? ? nil : win_combo
end

# def won?(board)
#   WIN_COMBINATIONS.select do |combo|
#     board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
#   end[0]
# end

def full?(board)
  board.all? { |position| position == "X" || position == "O" }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  won?(board) && board[won?(board)[0]]
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end