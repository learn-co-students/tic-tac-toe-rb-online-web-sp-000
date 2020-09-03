board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]
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

def position_taken?(board, index)
  board[index] != " " && board[index] != ""
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
  board.each do |index|
    if index != "" && index != " " && index != nil
      count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board).odd? == true
    return "O" # e.g 1 - x goes first
  elsif turn_count(board).even? == true
    return "X" #eg 2 - O goes second
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if board.any?{|index| index == "X" || index == "O"}
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    else
     return false
    end
  end
  return false
end

def full?(board)
  if board.all?{|index| index == "X" || index == "O"}
    return true
  elsif board.any?{|index| index == "X" || index == "O"}
    return false
  else return false
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
   return false
  end
end

def over?(board)
  if won?(board) != false or draw?(board) == true or full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false

    xcount = 0
    ocount = 0

    xcount += board.select{|index| index == "X"}.length()
    ocount += board.select{|index| index == "O"}.length()

    if xcount > ocount
      return "X"
    elsif ocount > xcount
      return "O"
    end
  end
end

def play(board)
  while over?(board) != true
    turn(board)
  end
  if won?(board) != false
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
