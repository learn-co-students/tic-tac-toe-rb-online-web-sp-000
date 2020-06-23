WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]  
]

board = [" "," "," "," "," "," "," "," "," "]


def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  
  def input_to_index(position)
    position.to_i - 1
  end


  def move(board,position,token)
     board[position] = token
   end
  
  def position_taken?(board, location)
    board[location] != " " && board[location] != ""
  end

   
  def valid_move?(board, position)
    position.between?(0,8) && !position_taken?(board, position)
  end

  def turn(board)
    puts "Please enter 1-9:"
    position = gets.strip
    index = input_to_index(position)
    if valid_move?(board, index)
        token = current_player(board)
      move(board, index, token)
      display_board(board)
    else
      turn(board)
    end
  end


  def turn_count(board)
    counter = 0
    board.each do |token|
    if token == "X" || token == "O"
      counter += 1
      ##binding.pry
    end
end
counter
end

def current_player(board)
    if turn_count(board) % 2 == 0
     return "X"
      else 
     return "O" 
    end
 end

 def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination # return the win_combination indexes that won.
  end
  if position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination # return the win_combination indexes that won.
end
end
false
end

def full?(board)
    if board.any? {|index| index == nil || index == " "}
    #binding.pry
    return false
    else
      return true
    end
  end

  def draw?(board)
  if !won?(board) && full?(board)
    #binding.pry
    return true
  else
    return false
  end
end

def over?(board)
    if draw?(board) || won?(board) || full?(board) 
      return true
    else
      return false
    end
  end

  def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    end
  end

  def play(board)
    counter = 0
    until counter == 9
    turn(board)
    counter += 1
    end
  end
  
  def play(board)
    until over?(board)
      turn(board) 
    end
    if won?(board)
      winner(board) == "X" || winner(board) == "O"
      puts "Congratulations #{winner(board)}!"
    else draw?(board)
      puts "Cat\'s Game!"
    end
  end
