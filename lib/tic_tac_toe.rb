require 'pry'

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
    #if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    #  return false
    #elsif draw?(board)
    #  return false
    #end
  
    WIN_COMBINATIONS.each do |combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]
  
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      #binding.pry
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combination
  
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combination
      
        
      end
      
    end
    return false
  end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
    if !won?(board) && full?(board)
        true
    else
        false  
    end
    
end

def over?(board)
  
    if won?(board) || draw?(board) 
        true    
    else
        false
    end
    #false
end

def winner(board)
  if won?(board).kind_of?(Array)
    return board[won?(board)[0]]
  else
    return nil
  end
  nil
end

def turn(board)
    puts "Please enter 1-9:"
    index = gets.strip.to_i

    index = input_to_index(index)

    if index.between?(0, 8) && valid_move?(board, index)
        
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
    #binding.pry
    if turn_count(board) % 2 == 0
        return "X"
    else
        return "O"
    end
end

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  
  
  
end
  
  # code your input_to_index and move method here!
def input_to_index(index)
  
    index.to_i - 1
  
end
  
def move(board, index, player)
    board[index] = player
    board
end

def valid_move?(board, index)

    if !position_taken?(board, index) && index.between?(0,8) && board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  
      true
  
    elsif !position_taken?(board, index) && index.between?(0,8)
  
      true
  
    else
  
      false
  
    end
  
  end
  
  # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
  
    if board[index] == " " || board[index] == "" || board[index] == nil
      false
  
    elsif board[index] == "X" || board[index] == "O"
  
      true
  
    end
  
end

def play(board)

    until over?(board)
        
        
        turn(board)
    end
        
    if draw?(board)
        puts "Cat's Game!"
            
    elsif won?(board)
            
        puts "Congratulations #{winner(board)}!"
    else

    end
    
end
