#Win_Combinations
WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], #Middle Row
  [6,7,8], #Bottom Row
  [0,3,6], #Right Row
  [1,4,7], #Middle Vertical
  [2,5,8], #Left Row
  [0,4,8], #Cross 1 
  [2,4,6], #Cross 2
  ]
#__________________________________________________  
#display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
#__________________________________________________  
#input_to_index
def input_to_index(user_input)
  user_input.to_i - 1
end
#__________________________________________________  
#move
def move(board, index, current_player)
  board[index] = current_player
end
#__________________________________________________  
#position_taken?
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
#__________________________________________________  
#valid_move?
def valid_move?(board,index)
    if index.between?(0,8) && position_taken?(board,index) == false
        true
    else 
        false
    end
end
#__________________________________________________  
#turn_count
def turn_count(board)  # Returns the number of turns that have been played
  counter = 0 
  board.each do |board|
    if board == "X" || board == "O"
      counter += 1
    end 
end 
return counter
end
#__________________________________________________  
#current_player
def current_player(board)
  if turn_count(board) % 2 == 0 
    "X"
  else 
    "O"
  end
end  
#__________________________________________________  
#turn 
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index) == true
    move(board, index, current_player(board))
   display_board(board)
 else
  turn(board)
  end 
end
#__________________________________________________
#won?
def won?(board)
   WIN_COMBINATIONS.detect do |i|
   board[i[0]] == board[i[1]] &&
   board[i[1]] == board[i[2]] &&
   position_taken?(board,i[0]) 
  end 
end 
#__________________________________________________
#full?
def full?(board)
  board.all?  do |i|
    #ask if i is equal to X or O 
  i == "X" || i == "O"  
end
end
#__________________________________________________
#draw?
def draw?(board)
   !won?(board) && full?(board)
end  
#__________________________________________________
#over?
def over?(board)
   won?(board)  || draw?(board) || full?(board)  
end  
#__________________________________________________
#winner?
def winner(board)
   won=won?(board)
   if won 
      board[won[0]]
    end  
end  
#__________________________________________________
#play?
def play(board)
  #until the game is over, keep repeating turns
  until over?(board)
    turn(board)
  end 
  #if there is a draw, put cats game, else put the winner
  if draw?(board)
   puts "Cat's Game!"
  else 
    puts "Congratulations #{winner(board)}!"  
  end  
end  
  
  
  
  #asks for players input on a turn of the game
  #user_input = gets.strip 
  #plays the first turn of the game
  #turn(board)
  
  # plays through an entire game 
  # start a loop and call turn(board)
  # counter = 1
  # until counter == 9
  # turn(board)
  # #checks if the game is a draw after every turns
  # draw?(board)
  # #stops playing on a draw & print cats game
  # if draw?(board)
  #   print "Cat's Game!" && over?(board)
  # end  
  # #checks if the game is over after every turn
  # over?(board)
  # #checks if the game is won after every turns
  # won?(board)
  # counter += 1
  # #stops playing if someone has won - if won, then the game is over
  # if won?(board) 
  #   over?(board)
  # end  
  # end
  
  # #Congratulates the winner X or O 
  # if winner(board) == "X"
  #   "Congratulations X!"
  # else 
  #   "Congratulations O!"
  # end

  

