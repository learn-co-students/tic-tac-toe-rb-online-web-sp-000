WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row (horizontal)
  [6,7,8],  # Bottom row
  [0,3,6],  # Left Column
  [1,4,7],  # Middle Column
  [2,5,8],  # Right Column
  [0,4,8],  # Diagonal 1 (negative slope)
  [2,4,6]   # Diagonal 2 (positive slope)
]


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
  return index
end

def move(board, index, char)
  board[index] = char
  return board
end


def won?(board)

  exes = board.each_index.select{ |i| board[i] == "X"}
  ohs = board.each_index.select{ |i| board[i] == "O"}

  experms = exes.permutation(3).to_a
  ohperms = ohs.permutation(3).to_a
  x_winning_index = WIN_COMBINATIONS.detect{ |win_combo| experms.include?(win_combo) }
  o_winning_index = WIN_COMBINATIONS.detect{ |win_combo| ohperms.include?(win_combo) }


  if (!!x_winning_index && !!o_winning_index)
    return false
  elsif x_winning_index
       return x_winning_index
  elsif o_winning_index
       return o_winning_index
    end
  end

def full?(board)
return board.none? {|i| (i == " ") || (i == "")}
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
if full?(board) || won?(board) || draw?(board)
  return true
else
  return false
end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  #elsif won?(board)[0] == "O"
    #return "O"
  #elsif won?(board)[0] == "X"
else
    return nil
  end
end

def turn_count(board)
  count = 0
  board.each do |space|
    if (space == "X") || (space == "O")
      count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board).even?
  #if (turn_count(board) % 2) == 0
    return "X"
  elsif turn_count(board).odd?
  #elsif (turn_count(board) % 2) != 0
    return "O"
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = input_to_index(gets.strip)

  if input == -1
    puts "Invalid input---input must contain an integer, 1-9."
    turn(board)
  elsif !valid_move?(board, input)
    puts "The location you entered is already occupied."
    turn(board)
  else
    board = move(board, input, current_player(board))
    display_board(board)
  end
end

def play(board)
  count = 0
 while ((count < 9) && !over?(board))
   turn(board)
   count += 1
end
  if draw?(board)
    puts "Cat's Game!"
 elsif won?(board)
   puts "Congratulations #{winner(board)}!"
end
end
