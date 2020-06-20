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


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
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

# Define your play method below
def play(board)
  until over?(board)
    turn(board)
  end
  result = winner(board)

  message = !result ? "Cat's Game!" : "Congratulations #{result}!"
  puts message
end


def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"

end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  combination = nil
  WIN_COMBINATIONS.each do |win_combination|
    win = win_combination.all? do |win_index|
      board[win_index] == "X"
    end
    if win
      combination = win_combination
    end
  end
  WIN_COMBINATIONS.each do |win_combination|
    win = win_combination.all? do |win_index|
      board[win_index] == "O"
    end
    if win
      combination = win_combination
    end
  end
  combination
end


def full?(board)
  board.all? {|element| element == "X" || element == "O" }
end

def draw?(board)
   full?(board) && !won?(board) ? true : false
end

def over?(board)
  full?(board) || won?(board) || draw?(board) ? true : false
end

def winner(board)
  if won?(board)
    result = won?(board)
    board[result[0]] == "X" ? "X" : "O"
  end
end
