WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  num = input.to_i
  final = num - 1
  final
end


def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board, index)
  if board[index] == "X" || board[index] == "O" || index > board.length() || index < 0
    false
  else
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    token = current_player(board)
    move(board, index, token) #token is X or O
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do
  |space|
  if space != " "
    count += 1
  end
end
count
end

def current_player(board)
  player = turn_count(board) # count
  if player % 2 == 0 #even
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each {|combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    end
  }
  return false
end

def full?(board)
  board.all? do |slot|
    slot != " "
  end
end

def draw?(board)
  if full?(board)  && !won?(board)
    return true
  else
    false
  end
end

def over?(board)
  if full?(board) && !won?(board) #not won and full = draw
    true
  elsif won?(board) && full?(board) #won and full
    true
  elsif won?(board) && !full?(board) #won and not full
    true
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
  until over?(board) == true || draw?(board) == true#while False
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
