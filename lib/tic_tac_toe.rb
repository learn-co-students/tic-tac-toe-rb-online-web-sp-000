# Helper Method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def position_taken?(board,location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def move(board, index, current_player)
  board[index] = current_player
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn != " "
    puts "#{counter}"
    counter += 1
  end
  end
  counter
end

def current_player(board)
  if turn_count(board).to_i % 2 == 0
    "X"
  else "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    current_player = current_player(board)
    move(board,index,current_player)
    display_board(board)
  else
    turn(board)
  end
end


WIN_COMBINATIONS =
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]]


def won?(board)
if board.all?(" ")
  false
  elsif !board.all?(" ")
        WIN_COMBINATIONS.each do |combination|
          position_1 = combination[0]
          position_2 = combination[1]
          position_3 = combination[2]
          combination.each do |position|
            if (board[position_1] == board[position_2] && board[position_2] == board[position_3]) && position_taken?(board,position_1)
              winner = board[position_1]
              return combination
            end
          end
        end
    false
    end
  end

def full?(board)
  if board.none?(" ")
    return true
  else
    return false
  end
end

def draw?(board)
  if won?(board) == false && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    return true
  end
end

def token(board)
  WIN_COMBINATIONS.each do |combination|
    position_1 = combination[0]
    position_2 = combination[1]
    position_3 = combination[2]
    combination.each do |position|
      if (board[position_1] == board[position_2] && board[position_2] == board[position_3]) && position_taken?(board,position_1)
        winner = board[position_1]
        return winner
      end
    end
  end
end

def winner(board)
  if won?(board) != false
    token(board)
  else
    return nil
  end
end

def play(board)
  while over?(board) != true
    turn(board)
  end
  if over?(board) == true
    draw?(board)
    if draw?(board) == true
    puts "Cat's Game!"
  else winner(board)
    if token(board) == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  end
  end
end
