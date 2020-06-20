WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

def won?(board)
top_row_win = [0,1,2]
middle_row_win = [3,4,5]
bottom_row_win = [6,7,8]
left_column_win = [0,3,6]
middle_column_win = [1,4,7]
right_column_win = [2,5,8]
left_diagonal_win = [0,4,8]
right_diagonal_win = [2,4,6]
if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X" || board[top_row_win[0]] == "O" && board[top_row_win[1]] == "O" && board[top_row_win[2]] == "O"
  WIN_COMBINATIONS[0]
 
 elsif board[middle_row_win[0]] == "X" && board[middle_row_win[1]] == "X" && board[middle_row_win[2]] == "X" || board[middle_row_win[0]] == "O" && board[middle_row_win[1]] == "O" && board[middle_row_win[2]] == "O"
   WIN_COMBINATIONS[1]
   
elsif board[bottom_row_win[0]] == "X" && board[bottom_row_win[1]] == "X" && board[bottom_row_win[2]] == "X" || board[bottom_row_win[0]] == "O" && board[bottom_row_win[1]] == "O" && board[bottom_row_win[2]] == "O"
    WIN_COMBINATIONS[2]
    
elsif board[left_column_win[0]] == "X" && board[left_column_win[1]] == "X" && board[left_column_win[2]] == "X" || board[left_column_win[0]] == "O" && board[left_column_win[1]] == "O" && board[left_column_win[2]] == "O"
    WIN_COMBINATIONS[5]
    
elsif board[middle_column_win[0]] == "X" && board[middle_column_win[1]] == "X" && board[middle_column_win[2]] == "X" || board[middle_column_win[0]] == "O" && board[middle_column_win[1]] == "O" && board[middle_column_win[2]] == "O"
    WIN_COMBINATIONS[6]
    
elsif board[right_column_win[0]] == "X" && board[right_column_win[1]] == "X" && board[right_column_win[2]] == "X" || board[right_column_win[0]] == "O" && board[right_column_win[1]] == "O" && board[right_column_win[2]] == "O"
    WIN_COMBINATIONS[7]

elsif board[left_diagonal_win[0]] == "X" && board[left_diagonal_win[1]] == "X" && board[left_diagonal_win[2]] == "X" || board[left_diagonal_win[0]] == "O" && board[left_diagonal_win[1]] == "O" && board[left_diagonal_win[2]] == "O"
    WIN_COMBINATIONS[3]
    
elsif board[right_diagonal_win[0]] == "X" && board[right_diagonal_win[1]] == "X" && board[right_diagonal_win[2]] == "X" || board[right_diagonal_win[0]] == "O" && board[right_diagonal_win[1]] == "O" && board[right_diagonal_win[2]] == "O"
    WIN_COMBINATIONS[4]
  end
end

def display_board(board)
  puts  " #{board[0]} | #{board[1]} | #{board[2]} "
  puts  "-----------"
  puts  " #{board[3]} | #{board[4]} | #{board[5]} "
  puts  "-----------"
  puts  " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
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
    count = 0
    board.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
  end
  count
end

def current_player(board)
  if turn_count(board) % 2 ==  0
     "X"
  else 
    "O"
  end
end

def play(board)
  turn = 0
  until over?(board) == true || turn == 9 
    turn(board)
    turn += 1
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end


def full?(board)
   board.all?{|i| i == "X" || i == "O"}
end
 
def draw?(board)
 if full?(board) && (!won?(board)) 
   true
  else
  false
end
end
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
  board[won?(board)[0]]
else
  nil
end
end
