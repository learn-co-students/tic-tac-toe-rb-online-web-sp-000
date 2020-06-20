  # Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  
    position_1 == position_2 && position_2 == position_3 && position_taken?(board,win_index_3)
  end
end

#full?
def full?(board)
  board.none?{|position| position == " "}
end

#draw?
def draw?(board)
  !won?(board) && full?(board)
end

#over?
def over?(board)
  if draw?(board) || won?(board)
    return true
  end
end


#winner
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
  return nil
end

#turn_count
def turn_count(board)
turn = 0
  board.each do |counter|
    if counter.to_s == 'X' || counter.to_s == 'O'
      turn += 1
    else
    end
  end
  return turn
end

#current_player
def current_player(board)
  if turn_count(board) % 2 == 0
    return 'X'
  else
    return 'O'
  end
end

# Helper Methods
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
  turn_counter = 1
  while turn_counter < 10
   turn_counter += 1
    turn(board)
  end
end

#play
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