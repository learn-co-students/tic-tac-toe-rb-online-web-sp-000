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
 
board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, marker)
  board[index] = marker
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  counter = 0
  board.each do |element|
    if element == "X" || element == "O"
      counter += 1
    else
      #do nothing
    end
  end
  return counter
end 

def current_player(board)
  if turn_count(board).even? == true
    return "X"
  else
    return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"        # ask for input 
  input = gets.strip              # get input 
  index = input_to_index(input)   # convert input to index 
  if valid_move?(board, index)    # if move is valid,  
    move(board, index, current_player(board))   #make move for index
    display_board(board)          # & show board 
  else                            # else 
    turn(board)                   # ask input again until valid move
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index1 = win_combination[0]
    win_index2 = win_combination[1]
    win_index3 = win_combination[2]
    position1 = board[win_index1]
    position2 = board[win_index2]
    position3 = board[win_index3]
    if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
      return win_combination
    else
      #do nothing
    end
  end
  return nil 
end

def full?(board)
  counter = 0
  board.each do |element|
    if element == "X" || element == "O"
      counter += 1
    else
      # do nothing
    end
  end
  if counter == 9 
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else
    return false
  end
end 

def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      position1 = board[win_combination[0]]
      position2 = board[win_combination[1]]
      position3 = board[win_combination[2]]
        if (position1 == "X" && position2 == "X" && position3 == "X")
          return "X"
        elsif (position1 == "O" && position2 == "O" && position3 ==  "O")
          return "O"
        else
          #do nothing
        end
      end
  else 
    return nil
  end
end 

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    #do nothing
  end
end
