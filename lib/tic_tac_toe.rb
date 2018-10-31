#WIN_COMBINATIONS constant
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
  
#display_board method 
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input_to_index method
def input_to_index(user_input)
  index = user_input.to_i - 1
end

#move method
def move(board, index, value)
  board[index] = value
end

#position_taken? method 
def position_taken?(board, index)
  if board[index] == " " or board[index] == "" or board[index] == nil
    return false
  else
    return true
  end
end

#valid_move? method
def valid_move?(board, index)
  if index.between?(0, 8) == true && position_taken?(board, index) == false
    return true 
  end
end

#turn method
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index) && !position_taken?(board, index)
    move(board, index, value = current_player(board))
    display_board(board)
  else turn(board)
  end
end

#turn_count method
def turn_count(board)
  counter = 0 
  board.each do |turn| 
    if turn == "X" or turn == "O"
    counter += 1
    end
  end
  return counter
end

#current_player method 
def current_player(board)
  turn_count(board).even? == true ? "X" : "O"
end

#won? method
def won?(board)
  winner = nil
  WIN_COMBINATIONS.each do |combination|
    if combination.all? {|token| board[token] == "X"}
      winner = combination
    elsif combination.all? {|token| board[token] == "O"}
      winner = combination
    else
      false
    end
  end
  if winner != nil
    winner
  else
    false
  end
end

#full? method 
def full?(board)
  board.none?{|token| token == " "} 
end

#draw? method 
def draw?(board)
  if won?(board) == false && full?(board) == true
  return true 
  end
end  

#over? method 
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

#winner? method
def winner(board)
  winner = nil
  WIN_COMBINATIONS.each do |combination|
    if combination.all? {|token| board[token] == "X"}
      winner = "X"
    elsif combination.all? {|token| board[token] == "O"}
      winner = "O"
    end 
  end
  winner
end

#play method
def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

    
  