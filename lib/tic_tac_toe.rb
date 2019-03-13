def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  while(!over?(board))
    turn(board)
    if won?(board)||draw?(board)
      break
    end
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  end
  if draw?(board)
    puts "Cat's Game!"
  end
end

def turn_count(board)
  count=0
  board.each do |space|
    if space != " "
      count += 1
    end
  end
    return count
end

def current_player(board)
  if (turn_count(board).odd?)
    return "O"
  else
    return "X"
  end
end

def full?(board)
  if(board.include?(" "))
    return false
  else
    return true
  end
end

def won?(board)

  WIN_COMBINATIONS.any? do |wins|
    if wins.all? do |space| board[space]=="X" end||wins.all? do |space| board[space]=="O" end
      return wins
    end
  end
end

def draw?(board)
  full?(board)&&!won?(board)
end

def over?(board)
  if won?(board).is_a?(Array)||full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if(won?(board))
    return board[won?(board)[0]]
  end
end
