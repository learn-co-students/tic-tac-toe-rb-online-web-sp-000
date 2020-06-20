
def display_board(board)
  firstline = " " + board[0] + " | " + board[1] + " | " + board[2] + " "
  secondline = " " + board[3] + " | " + board[4] + " | " + board[5] + " "
  thirdline = " " + board[6] + " | " + board[7] + " | " + board[8] + " "
  puts firstline
  puts "-----------"
  puts secondline
  puts "-----------"
  puts thirdline
end

def input_to_index(input)
  index = input.to_i
  index -= 1
end

def move(board, index, value)
    board[index] = value

end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if (index < 0) || (index > 8)
    return false
  elsif position_taken?(board, index)
    return false
  elsif (index >= 0) && (index <= 8)
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = 0
  input_to_index(input)
  index = input.to_i
  index -= 1
  value = current_player(board)
  if valid_move?(board, index)
    move(board, index, value)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
    board.each do |space|
      if (space == "X") || (space == "O")
        counter += 1
      end
    end
    return counter
end

def current_player(board)
  thing = turn_count(board)
  if thing % 2 == 0
    return "X"
  else
    return "O"
  end
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  # ETC, an array for each win combination
]


# Helper Method


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  return false
  end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
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
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end


def play(board)
  while over?(board) == false
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  end
  if draw?(board)
    puts "Cat's Game!"
  end
end
