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


def input_to_index(input)
  input.to_i - 1
end


def move(board, index, token)
  board[index] = token
end
  
  
def position_taken?(board, index)
  
  if board[index] == "" || board[index] == " " || board[index] == nil
    return false
    
  else true
    
  end
end


def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    return true
  else false
    
  end
end


def turn_count(board)
  turn_num = 0
  board.each do |space|
    if space == "X" || space == "O"
      turn_num +=1
      end
    end
    
  return turn_num
end

def current_player(board)
  turns = turn_count(board)
  
  if turns.even?
    return "X"
    
  else "O"
  end
end


def turn(board,index,token)
  puts "Please choose a number 1-9:"
  input = gets.chomp
  input_to_index(input)
  if valid_move?(board, index) == true
    player_token = current_player
    move(index, token)
    display_board
  else
    turn
  end
end



   def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end 

  
def full?(board)
  board.all? { |index| index == "X" || index == "O"}
end


def draw?(board)
  if full?(board)==true && (!won?(board))==true
    return true
  else 
    return false
end
end


def over?(board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  else
    false
  end
end


def winner (board)
  index = []
  index = won?(board)
  if index == false
    nil
  else
    if board[index[0]] == "X"
      "X"
    else
      "O"
    end
  end
end


def play(board)
  
end

