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

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  if  index.between?(0,8) && !position_taken?(board, index)
    return true
  else
  puts"invalid move try again"
  end
end

def turn_count(board)
  counter = 0
  board.each do |move|
    if move == "X" || move == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
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

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
      if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board,combo[0])
        return combo
    end
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  end
 end

def play(board)
  turn(board) until over?(board)
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts"Cat's Game!"
    end
  end








#  actual solution

# def won?(board)
#   WIN_COMBINATIONS.detect do |combo|
#     board[combo[0]] == board[combo[1]] &&
#     board[combo[1]] == board[combo[2]] &&
#     position_taken?(board, combo[0])
#   end
# end


# def won?(board)
#  WIN_COMBINATIONS.detect do |combo|
#    win_index_1 = combo[0]
#    win_index_2 = combo[1]
#    win_index_3 = combo[2]
#
#    position_1 = board[win_index_1]
#    position_2 = board[win_index_2]
#    position_3 = board[win_index_3]
#
#    if position_1 == position_2 && position_2 == position_3 && position_taken?(board,win_index_1)
#      return combo
#
#
#     end
#   end
# end

def full?(board)
  board.all? do |space|
     space == "X" || space == "O"
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board) == true
    return true
  end
end

 def over?(board)
   if draw?(board) || won?(board)
     return true
   end
  end

  def winner(board)

    if won?(board)
      won?(board).detect do |symbol|
        if board[symbol] == "X" || board[symbol] == "O"
          return board[symbol]
      end
    end
  end
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 4, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 4, 6],
  [2, 5, 8],
  [3, 4, 5],
  [6, 7, 8]
]
