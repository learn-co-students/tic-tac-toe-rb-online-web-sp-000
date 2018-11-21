WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
rescue
  index = -1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  !(board[index] == nil || board[index] == " ")
end

def valid_move?(board, index)
  position_taken?(board, index) == false && index.between?(0, 8) == true
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  while valid_move?(board, index) == false
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
  end
  player = current_player(board)
  move(board, index, player)
  display_board(board)
end

def turn_count(board)
  count = 0
  board.each do |index|
    if index == "O" || index == "X"
      count += 1
    end
  end
  return count
end

def current_player(board)
  player = turn_count(board) % 2 == 0 ? "X" : "O"
  return player
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if position_taken?(board, win_combination[0]) == true
      if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]]
        return win_combination
      else
        false
      end
    else
    end
  end
  false
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  full?(board) == true && won?(board) == false
end

def over?(board)
  !(won?(board)) == false || draw?(board) == true
end

def winner(board)
  if win = won?(board)
    board[win.first]
  end
end

def play(board)
  while over?(board) == false do
    turn(board)
  end
  if draw?(board) == true
    puts "Cat's Game!"
  elsif !won?(board) == false
    winner_player = winner(board)
    puts "Congratulations #{winner_player}!"
  end
end
