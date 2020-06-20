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
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
   user_input.to_i - 1
end

def turn_count(board)
counter = 0
  board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
  end
  return counter
end


def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def move(board, index, character)
board[index] = character
end

def position_taken?(board, index)
  if board[index] == "  " || board[index] == " " || board[index] == nil
  false
else
  taken = true
end
end

def valid_move?(board, index)
if index.between?(0,8) && !position_taken?(board, index)
  true
end
end

def turn(board)
  puts "Please enter 1-9:"
character = current_player(board)
  user_input = gets.chomp
  index = input_to_index(user_input)
  if !valid_move?(board, index)
    turn(board)
  else
    move(board, index, character)
    puts display_board(board)
  end
end

def full?(board)
  board.all? do |position|
   position == "X" || "O" && position != " "
end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif !won?(board)
    false
  elsif won?(board)
    false
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

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if !won?(board) && !full?(board) || draw?(board)
    puts nil
  else won?(board)
    win_combination = won?(board)
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
  position_1
end
end


def play(board)
  until over?(board)
    turn(board)
end
      if won?(board)
        winner = winner(board)
        puts "Congratulations #{winner}!"
      elsif draw?(board)
        puts "Cat's Game!"
  end
end
