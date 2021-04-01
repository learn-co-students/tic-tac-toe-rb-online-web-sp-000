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
  rows = [
    " #{board[0]} | #{board[1]} | #{board[2]} ",
    "-----------",
    " #{board[3]} | #{board[4]} | #{board[5]} ",
    "-----------",
    " #{board[6]} | #{board[7]} | #{board[8]} "
  ]
  puts rows
end

def input_to_index(input)
  if input =~ /[^1-9]/
    index = -1
  elsif input.class == "Fixnum" && input > 0 && input < 10
    index = input - 1
  else
    index = input.to_i - 1
  end
end

def move(board, coordinate, symbol)
  board[coordinate] = symbol
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
end

def valid_move?(board, move)
  if !position_taken?(board, move) && move.between?(0, 9)
    true
  else
    false
  end
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
  turn = turn_count(board)
  current_player = turn.even? ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Not a valid entry."
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    #store values from board from the win combination being checked this iteration
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    #check the values at the win combination indexes for a same-token streak
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?(board)
  board.none? do |space|
    space == " "
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  win_combination = won?(board)
  if won?(board)
    board[win_combination[0]]
  else
    nil
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat\'s Game!"
  end
end
