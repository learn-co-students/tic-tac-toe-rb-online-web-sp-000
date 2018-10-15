WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5],  # Middle row
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
  index = input.to_i - 1
  return index
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def move(board, index, token)
  board[index] = token
  return board
end

def position_taken?(board, index)
  !(board[index] == nil || board[index] == " ")
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
    if valid_move?(board, index)
      token = current_player(board)
      move(board, index, token)
      display_board(board)
    else  puts 'try again'
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |empty_spot|
    if empty_spot == "X" || empty_spot == "O"
      turns += 1
    end
  end
  return turns
end

def current_player(board)
  #if the turn_count is even return "X" else return "O"
  turns = turn_count(board)
  if turns.even?
    return "X"
    else
      return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each {|win_combination|
    index_0 = win_combination[0]
    index_1 = win_combination[1]
    index_2 = win_combination[2]

    pos_1 = board[index_0]
    pos_2 = board[index_1]
    pos_3 = board[index_2]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return win_combination
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return win_combination
    end
  }
  return false
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else return false
  end
end

def over?(board)
  if draw?(board) || (won?(board) && full?(board)) || (won?(board) && !full?(board))
    return true
  end
end

def winner(board)
  index = won?(board)
   !index ? nil : board[index[0]]
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
