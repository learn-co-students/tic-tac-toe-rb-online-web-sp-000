WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
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

<<<<<<< HEAD
def move(board, index, current_player)
=======
def move(board, index, current_player = "X")
>>>>>>> 1a51f007bb5d4b51e10a71b8c6052a6a66361226
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
<<<<<<< HEAD
    move(board, index, current_player(board))
=======
    move(board, index)
>>>>>>> 1a51f007bb5d4b51e10a71b8c6052a6a66361226
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each { |position|
    if position != " "
      count += 1
    end
  }
  puts count
  count
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.each do |position|
    if position == " "
      return false
    end
  end
  return true
end

def draw?(board)
  if won?(board) == false && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) == false
    if draw?(board)
      return true
    elsif full?(board) == false
      return false
    end
  else
    return true
  end
end

def winner(board)
  win = won?(board)
  if win == false
      return nil
  else
      return board[win[0]]
  end
end

def play(board)
<<<<<<< HEAD
  until over?(board) do
    turn(board)
  end
  if won?(board) == false
    puts "Cat's Game!"
  else
    puts "Congratulations " + winner(board) + "!"
=======
  turn_count = 0
  while turn_count < 9
    turn(board)
    turn_count+=1
>>>>>>> 1a51f007bb5d4b51e10a71b8c6052a6a66361226
  end
end
