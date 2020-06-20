WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board = [])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  converted_input = user_input.to_i - 1
end

def move (board, position, character)
    board[position] = character
end

def position_taken?(board, index)
   if board[index] == "O"
    return true
  elsif board[index] == "X"
    return true  
  else
    return false
  end
end

def valid_move?(board,index)
  if position_taken?(board, index) == false && index.between?(0,8)
    return true
  else position_taken?(board, index) == true
    return false
  end
end

def turn(board)
  user_input = gets.chomp
  puts "Please enter 1-9:"
  index = input_to_index(user_input)
    if valid_move?(board,index)
      move(board, index, current_player(board))
      display_board(board)
    else turn(board)
  end
end

def turn_count(board)
  board.count{|i| i == 'X' || i == 'O' }
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else turn_count(board).odd?
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |combo|
      if board[combo[0]] == board [combo[1]] && board[combo[1]] == board [combo[2]]
      position_taken?(board, combo[0])
      end
    end
end

def full?(board)
  board.all?{|player| player == "X" || player == "O"}
  end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if winning_token = won?(board)
    board[winning_token.first]
end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
end
end
