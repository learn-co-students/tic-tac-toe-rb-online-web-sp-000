def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
######################################################
def turn_count(board)
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  return turns
end
###############################################################################
def position_taken?(board, index)
  board[index] != " "
end
###############################################################################
def current_player(board)
  if turn_count(board) % 2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
  return current_player
end
###############################################################################
def move(board, index, current_player)
  board[index] = current_player
end
###############################################################################
def input_to_index(input)
  input_to_index = input.to_i - 1
end
###############################################################################
def valid_move?(board, index)
  #if index.between?(0,8)
    #if !position_taken?(board, index)
      #true
    #end
  #end
#end
  index.between?(0,8) && !position_taken?(board,index) #if the index is between 0-8 and not taken == true
end
################################################################################
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player = current_player(board)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end
###############################################################################
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

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
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner (board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
###############################################################################
def play(board)
  #turn_count = 0
  #while turn_count < 9
    #turn(board)
    #turn_count += 1
  #end
    until over?(board) == true
      turn(board)
    end

      if won?(board)
        puts "Congratulations #{winner(board)}!"
      elsif draw?(board)
        puts "Cat's Game!"
      end
end
