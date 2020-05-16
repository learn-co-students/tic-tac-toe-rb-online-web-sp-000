def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
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

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end

def valid_move?(board, index)
  board[index] != "X" && board[index] != "O" && index.between?(0, 9)
end

def turn_count(board)
  tokens = board.select { |position| position == "X" || position == "O"}
  return tokens.length
end

def current_player(board)
  xes = board.select { |position| position == "X" }
  os = board.select { |position| position == "O" }
  if xes.length == 0
    return "X"
  elsif xes.length <= os.length
    return "X"
  elsif xes.length > os.length
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each { |combo|
    if board[combo[0]] != " " &&
       board[combo[0]] ==  board[combo[1]] &&
       board[combo[1]] ==  board[combo[2]]
       return combo
       break
    end }
  return false
end

def full?(board)
  characters = board.select { |position| position == "X" || position == "O"}
  characters.length == 9
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) != false
    combo = won?(board)
    return board[combo[0]]
  end
end

def turn(board)
  puts "Where would you like to go on the board?"
  input = gets.strip.to_i
  index = input_to_index(input)
  character = current_player(board)
  if valid_move?(board, index) == true
    move(board, index, character)
  else
    puts "Invalid Move"
    turn(board)
  end
end

#play method
def play(board)
  while over?(board) == false
    turn(board)
    display_board(board)
  end
  if draw?(board) == true
    puts "Cat's Game!"
  elsif won?(board) != false
    winner = winner(board)
    puts "Congratulations #{winner}!"
  end
end
