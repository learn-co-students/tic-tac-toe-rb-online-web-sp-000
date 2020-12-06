WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8],
]
def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
 index = input.to_i - 1
end


def move(board, index, value)
  board[index] = value
  return board
end


def position_taken?(board, index)
  #!(board[index].nil? || board[index] == " " || board[index] == "")
  (board[index] == "X" || board[index] == "O")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  turn_count = 0
  board.each do |value|
    if value == "X" || value == "O"
      turn_count += 1
    end
  end
  return turn_count
end

def current_player(board)
  turn_count(board).even? ? "X": "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combinations|
    position_1 = combinations[0]
    position_2 = combinations[1]
    position_3 = combinations[2]
    if board[position_1] == "X" && board[position_2] == "X" && board[position_3]  == "X"
      return combinations
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return combinations
    end
  end
end

def full?(board)
  board.all? do |positions|
    positions == "X" || positions == "O"
  end
end

def draw?(board)
 !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) 
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  else
    return nil
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input=gets.strip
  index=input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board) )
  else
    return turn(board)
  end
  display_board(board)
end

def play(board)
     until over?(board)
        turn(board)
     end
     if draw?(board)
        puts "Cat's Game!"
     else
        won?(board)
        winner(board) == "X" || winner(board) == "O"
        puts "Congratulations #{winner(board)}!"

     end
  end
