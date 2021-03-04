

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

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
  [2,4,6],
]

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, token)
  if valid_move?(board, index)
    board[index] = token
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board,index)
    return true
  else 
    return false 
  end
end

    

def won?(board)
  if empty_board?(board)
    return nil
  else
    WIN_COMBINATIONS.each do |win_combo| 
      if win_combination?(board, win_combo)
        return win_combo
      end
    end
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


def full?(board)
  board.each do |space|
    if space == "" || space == " "
      return false
    end
  end
  return true
end

def over?(board)
  if draw?(board)
    return true
  elsif full?(board) && won?(board)
    return true
  elsif won?(board)
    return true
  else
    return false
  end
end
  
def winner(board)
  w_index = won?(board)
  if w_index
    return board[w_index[0]]
  else
    return nil
  end
end

def win_combination?(board, indexes)
  if (board[indexes[0]] == "X" && board[indexes[1]] == "X" && board[indexes[2]] == "X") || (board[indexes[0]] == "O" && board[indexes[1]] == "O" && board[indexes[2]] == "O") 
    return true
  end
end

def empty_board?(board)
  counter = 0
  board.each do |space|
    if (space != "X" && space != "O")
      counter +=1
    end
  end
  if counter == 9
    return true
  else 
    return false
  end
end

def turn_count(board)
  counter = 0
  board.each{ | item |
    if space_ocupied?(item)
      counter += 1
    end
  }
  return counter
end

def space_ocupied?(item)
  if (item =="X" || item == "O")
    return true
  else 
    return false
  end
end

def current_player(board)
  if (turn_count(board) % 2 == 0)
    return "X"
  else
    return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  
  if valid_move?(board,index)
    move(board,index,current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def play(board)
  
  while !over?(board) do
    turn(board)
  end
  
  if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
end