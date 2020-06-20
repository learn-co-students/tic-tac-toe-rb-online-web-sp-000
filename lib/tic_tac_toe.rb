board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]
  
def input_to_index(user_input)
  index = (user_input.to_i) - 1
  return index
end

def move(board, index, token)
  board[index] = token
end

#def position_taken?(board, index)
 # !(board[index].nil? || board[index] == " ")
#end
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
    elsif board[index] == "X" || board[index] == "O"
    return true
  end
end


def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
    return true
    else
      return false
  end
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  token = current_player(board)

  if valid_move?(board, index)
   move(board, index, token)
   display_board(board)


  elsif valid_move?(board, index) == false
  turn(board)
  end
end


def turn_count(board)
 counter = 0
  board.each do |index|
    if index == "X" || index == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end


def won?(board)

    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 =="O" && position_3 == "O"
        return win_combination

      end
    end
    else
        return false
  end


def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end


def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end


def winner(board)
if won?(board) != false
  winning_board = won?(board)
    if board[winning_board[0]] == "X"
    return "X"
    elsif board[winning_board[0]] == "O"
    return "O"
    end
  else
    return nil
 end
end


def play(board)
  until over?(board) == true
  turn(board)
  turn_count(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else 
    puts  "Cat's Game!"
  end
end
