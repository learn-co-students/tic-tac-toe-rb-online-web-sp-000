# Helper Method
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
  play_turn = 0 
  until over?(board) 
    turn(board)
    play_turn += 1 
  end
  if draw?(board) == true
    puts "Cat's Game!"
  else 
    puts "Congratulations #{winner(board)}!"
  end
end

def turn_count(arr)
  turns = 0
  arr.each do |space|
    if space == "O" || space =="X"
      turns += 1
    end
  end
  return turns
end

def current_player(board)
  turn = turn_count(board)
  if turn % 2 == 0 
    return "X"
  else 
    return "O"
  end
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
  [6,4,2]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    positions = [
      board[win_index_1],
      board[win_index_2],
      board[win_index_3]
      ]
      
    if positions.all? {|position| position == "X"} || positions.all? {|position| position == "O"} 
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  won?(board) || draw?(board) || full?(board)  
end

def winner(board)
  win_combo = won?(board)
  if win_combo != false
    return board[win_combo[0]]
  else
    return nil
  end
end
