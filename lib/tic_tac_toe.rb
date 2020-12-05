#WIN_COMBINATIONS

WIN_COMBINATIONS=[
 #horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
 #vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
 #diagonal
  [0,4,8],
  [2,4,6]
  ]


#display_board

  def display_board(board= [" "," "," "," "," "," "," "," "," "])
  puts " #{board[0]} | #{board[1]} | #{board[2] } "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5] } "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8] } "
end

display_board

#input_to_index

def input_to_index(user_input = [1,2,3,4,5,6,7,8,9])
  user_input.to_i - 1
end

#move

def move(board, index, player_token)
    board [index] = player_token
  end


#position_taken

def position_taken?(board,position)
  if board[position] == " " || board[position] == "" || board[position] == nil
    false
    else  
    true
end
end


def valid_move?(board, index)
  if !position_taken?(board, index) && (index).between?(0,8)
    return true
  else 
    return false
  end
end

#turn_count

def turn_count(board)
  turns = 0 
  board.each do |i|
  if i == "X" || i == "O"
    turns += 1
  end
end

return turns
end

#current_player

def current_player(board)
  i = turn_count(board)
if i % 2 == 0
  return "X"
else
  return "O"
end
end


#turn

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player_token = current_player(board)
  if valid_move?(board, index)
    move(board, index, player_token)
    display_board(board)
  else 
    turn(board)
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
 #horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
 #vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
 #diagonal
  [0,4,8],
  [2,4,6]
  ]
  
  #Won 
  def won? (board)
    WIN_COMBINATIONS.each {|yaWon|
      index_0 = yaWon[0]
      index_1 = yaWon[1]
      index_2 = yaWon[2]
      
      p_1 = board [index_0]
      p_2 = board [index_1]
      p_3 = board [index_2]
      
    if p_1 == "X" && p_2 == "X" && p_3 == "X"
    return yaWon
    elsif p_1 == "O" && p_2 == "O" && p_3 == "O"
    return yaWon
  end
    }
  
    return false
  end
  
  #full?
  
  def full?(board)
    board.all? {|index| index == "X" || index == "O"}
 end

#draw?

def draw?(board)
  if !won?(board) && full?(board)
    return true 
  end
end

#over?
def over?(board)
  if won?(board) || draw?(board)
    return true
  end
end

#winner

def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
  if board[index[0]] == "X"
      return "X"
    elsif board[index[0]] == "O"
      return "O"
    else return false
    end
  end
  end

#play    
  def play(board)
i = 0
while over?(board) != true
  i += 0
  turn(board)
end
if winner(board) != false && over?(board) != false
  puts "Congratulations #{winner(board)}!"
end
if draw?(board) != false && over?(board) != false
  puts "Cat's Game!"
end
end