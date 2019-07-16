def display_board(board)
puts "  #{board[0]} | #{board[1]}  | #{board[2]}    "
puts"--------------"
puts "  #{board[3]} | #{board[4]}  | #{board[5]}    "
puts"--------------"
puts "  #{board[6]} | #{board[7]}  | #{board[8]}    "
end

def input_to_index(input)
  index = input.to_i - 1 
end


def position_taken?(board, index)
  if board[index] == " " || board[index] == NIL
    FALSE
  else
    TRUE
  end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index >= 0 && index <= 8
    TRUE
  else
    FALSE
  end
end

def move(board, index, player_character)
  board[index] = player_character
end

def turn(board)
  puts "Please enter a postion between 1 and 9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    until valid_move?(board, index)
      puts "Sorry, your move was invalid. Please try again."
      input = gets.strip
      index = input_to_index(input)
    end
    move(board, index, current_player(board))
    display_board(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |board_space|
    if board_space == "X" || board_space == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0 
    "X"
  else
    "O"
  end
end

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

def won?(board)
  WIN_COMBINATIONS.any? do |win_combination|
      win_index1 = win_combination[0]
      win_index2 = win_combination[1]
      win_index3 = win_combination[2]
      position1 = board[win_index1]
      position2 = board[win_index2]
      position3 = board[win_index3]
      if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
        return [win_index1, win_index2, win_index3]
      end
    end
end

def full?(board)
  board.all? do |board_space|
    board_space != " " && board_space != NIL
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return TRUE
  else
    return FALSE
  end
end

def over?(board)
  if won?(board).class == Array || draw?(board) || full?(board)
    return TRUE
  else
    return FALSE
  end
end

def winner(board)
  winner = board[won?(board)[0]]
end

def play(board)
  until over?(board)
    turn(board)
  end
  if !draw?(board) 
    puts "Congratulations!! #{winner(board)} is the winner and the best in the world!"
  else
    puts "It is a draw!! We are both the best!"
  end
end



