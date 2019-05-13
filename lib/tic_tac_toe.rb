 WIN_COMBINATIONS = [
  
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left to right diagnol
  [2,4,6], #Right to left diagnol
  
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
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  x_count = 0
  o_count = 0
  
  board.each do |b|
    x_count += 1 if b == "X"
    o_count += 1 if b == "O"
  end
  
  x_count + o_count
end

def current_player(board)
  
  if turn_count(board) % 2 == 0
    return "X"
  else 
    return "O"
  
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |c|
    first_pos = board[c[0]]
    second_pos = board[c[1]]
    third_pos = board[c[2]]
    
    return c if (first_pos == second_pos) && (second_pos == third_pos) && position_taken?(board, c[0])
  end
  
  false
end

def full?(board)
  board.each do |x|
    if x == " "
      return false
    else 
      true
    end
  end
end

def draw?(board)
  return true if full?(board) && !won?(board)
  false
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    false
  end
end

def winner(board)
  if won?(board)
    return "X" if board[won?(board)[0]] == "X"
  "O"
  end
end

def play(board)
  
  while over?(board) == false
    turn(board)
  end
  
  puts "Cat's Game!" if draw?(board)
  
  puts "Congratulations #{winner(board)}!" if won?(board)
  
end





























