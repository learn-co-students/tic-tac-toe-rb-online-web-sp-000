# Helper Method
# def position_taken?(board, index)
#   !(board[index].nil? || board[index] == " ")
# end

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
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)

    if won?(board)
    return
  elsif over?(board)
      return
  end
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    cp = current_player(board)
    move(board, index, cp)
    display_board(board)
    return


  else
    turn(board)
  end
end


def turn_count(board)
  i = 0
  count = 0
  while i < board.length
    if board[i] == "X"
      count += 1
    elsif board[i] == "O"
      count += 1
    end
    i += 1
  end
  return count
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
  [2,4,6]
]

def current_player(board)



  num = turn_count(board)
  if num.even?
    return "X"
  elsif num.odd?
    return "O"
  end
end

def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  end


  i = 0
  WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      i += 1
      if position_1 == ("X") && position_2 == ("X") && position_3 == ("X")
        return true
       elsif position_1 == ("O") && position_2 == ("O") && position_3 == ("O")
         return true
  end
end

if i == 8
  return false
end

end

def full?(board)
  # if won?(board)
  #   return true
  # end
  board.each do |index|
    if index == " "
    return   false
  end
end
  board.each do |index|
    if index == "X"
      true
    elsif index == "O"
      true
  end
  return true
end
end






def draw?(board)


    if won?(board)
      return false
    elsif full?(board)
          true
  end
    board.each do |index|
      if index == " "
      return   false
      end
    end


  end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
    return false
  end

def winner(board)

  if won?(board)
  WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == ("X") && position_2 == ("X") && position_3 == ("X")
        return "X"
       elsif position_1 == ("O") && position_2 == ("O") && position_3 == ("O")
         return "O"
    end
  end
end
  if draw?(board) == true || full?(board) == false
    return nil
  end
end

def play(board)
i = 0
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  return
end
if draw?(board)
puts "Cat's Game!"
return
end
  turn(board)

  while i < 9
    if won?(board)
      winner(board)
      puts "Congratulations #{winner(board)}!"
      return
    elsif draw?(board)
      puts "Cat's Game!"
      return
  # elsif over?(board)
  #   return
    end
  i += 1
  turn(board)
end
end
#
#   if over?(board)
#     return board
#
#   elsif won?(board)
#
#     puts "Congratulations #{current_player}!"
#     return
#   elsif draw?(board)
#     puts "Cat's Game!"
#     return
#
#   end
#
# end
