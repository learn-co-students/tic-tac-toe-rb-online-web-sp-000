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
  [6,4,2]
]

def won?(board)
      WIN_COMBINATIONS.each {|n|
        index1 = n[0]
        index2 = n[1]
        index3 = n[2]

        position1 = board[index1]
        position2 = board[index2]
        position3 = board[index3]

        if position1 == "X" && position2 == "X" && position3 == "X"
          return n
        elsif position1 == "O" && position2 == "O" && position3 == "O"
          return n
        end
      }
      return false
end

def full? (board)
  board.all? { |i| i == "X" || i == "O"  }
end

def draw? (board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over? (board)
  if draw?(board)
    return true
  elsif won?(board) && full?(board)
    return true
  elsif won?(board) && !full?(board)
    return true
  end
end

def winner (board)
  win = []
  win = won?(board)
  if win == false
    return nil
  else
    if board[win[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position != " "
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end


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

def play (board)
  count = 0
  while count < 9
    turn(board)
    count += 1
  end
end

def play (board)
  until over?(board) == true
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
