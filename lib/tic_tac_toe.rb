WIN_COMBINATIONS = [[0, 1, 2], [1, 4, 7], [2, 5, 8], [0, 3, 6], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]]

board = [" "," "," ","X","X","X"," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  index = "#{input}".to_i - 1
  if index.between?(0, 8)
    return index
  else 
    return -1
  end
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  if board[index] == "" or board[index] == " "
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def turn(board)
  puts "Please enter a number between 1-9"
  input = gets.strip.to_i
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn_count = 0
  board.each do |i|
    if i == "X" || i == "O"
      turn_count += 1
    end
  end
  return turn_count
end

#if modular operator == 0 this means "O" just finished their turn.

def current_player(board) 
  x_turn = turn_count(board) % 2
  if x_turn == 0
    return "X"
  else 
    return "O"
  end
end


#add if under WIN_COMBINATIONS if you wanna go back to the original code you wrote, uncomment stuff. This is a refactored version of the current code.

def won?(board)
  WIN_COMBINATIONS.detect do |i|
    board[i[0]] == board[i[1]] && board[i[2]] == board[i[1]] && position_taken?(board, i[0])
  #     return i 
  #   end
  end
  # return false
end

def full?(board)
  turn_count(board) == 9 
end
    
def draw?(board)
  !won?(board) && full?(board) #true
  # !won?(board) && !full?(board) #false
  # !won?(board) #false
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
   
def play(board)
  turn(board) while !over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

# #or

# def play(board)
#   turn(board) until over?(board)
#   if won?(board)
#     puts "Congratulations #{winner(board)}!"
#   elsif draw?(board)
#     puts "Cat's Game!"
#   end
# end


###Code below also works, but does not pass the test for some reason####
# def play(board)
#   while !over?(board) do
#     turn(board)
#     if won?(board)
#       puts "Congratulations #{winner(board)}!"
#     elsif draw?(board)
#       puts "Cat's Game!"
#     end
#   end
# end