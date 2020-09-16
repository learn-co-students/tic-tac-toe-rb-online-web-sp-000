

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

def display_board(board)  
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
    if board[index] == " "
        false
    elsif board[index] == ""
        false
    elsif board[index] == nil
        false
    elsif board[index] == "X" || board[index] == "O"
        true
    end
end

def valid_move?(board, index)
    #index is within a range of 0-8 And board at index is not occupied
    index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)	
  board.count{|token| token == "X" || token == "O"}	

  turns = 0	
  board.each do |player| 	
    if player == "X" || player == "O"	
      turns += 1	
    end	
  end        	
  turns	

end

def current_player(board)
    turn_count(board).even? ? "X" : "O"
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

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && 
    board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
  end
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
  # returns true for every iteration for the entire method
  # if any iteration == false, entire expression false
end

def draw?(board)
  #returns true if the board is full && has not been won
  #returns false if the board is not full && not won
  full?(board) && !won?(board)
end

def over?(board)
  # returns true if the board has been won || draw || full
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  # returns "X" or "O" if won? 
  # # else returns nil
  if  winner = won?(board)
    board[winner[0]]
  end
end

def play(board)
    until over?(board)
        turn(board)
    end
    # if game won
    ## congratulate the winner
    # else if the game was a draw
    ## tell the players it has been a draw
    if won?(board)
        puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
        puts "Cat's Game!"
    end
end
               
    
    
    # until over?(board)
    #     turn(board)
    # end
    # if won?(board)
    #     puts " Congratulations you won!"
    # elsif draw?(board)
    #     puts "It's a draw!"
    # end


