require 'pry'
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [0, 3, 6],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  [6, 7, 8],
  [1, 4, 7]
  
  ]

  def display_board(board)
      puts " X | X | X "
      puts "-----------"
      puts " O | X | O "
      puts "-----------"
      puts " O | O | X "
  end 
  
  def input_to_index(user_input)
       user_input.to_i - 1 
      
  end 
  
  def move(board, position, player)
    board[position] = player 
  end 
  
  def position_taken?(board, index)
   board[index] != " "
  end   
  
  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end 
    
  def turn(board, position, index) 
    if valid_move?(board, index)
      move(board, position, player)
    else
      turn(board, position, player)
    end 
  end 
  #def turn_count
    
    
  #def current_player
    
    
  #def won?
    
    
  #def full?
    
  #def draw?
    
  #def over?
    
  #def winner
    
  #def play 
