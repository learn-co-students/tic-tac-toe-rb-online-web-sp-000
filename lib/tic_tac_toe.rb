
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #mid row
    [6, 7, 8], #bot row 
    [0, 3, 6], #1st col
    [1, 4, 7], #2nd col
    [2, 5, 8], #3rd col
    [0, 4, 8], #left diag
    [2, 4, 6]  #right diag
 ]

 def display_board (board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------\n"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------\n"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(input)
    position_index = input.to_i - 1
  end
  

  def move(board, index, player)
    board[index] = player
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
  def turn_count(board)
    counter = 0 
    board.each do |move|
      if move =="X" || move =="O"
        counter +=1 
      end
    end
  counter
  end
  
  def current_player(board)
    if turn_count(board).to_i.even?
      "X"
    else
      "O"
    end
  end
 def won? (board)
   WIN_COMBINATIONS.detect do |array|
     array.all? {|index| board[index] == "X"} || array.all? {|index| board[index] == "O"}
   end
 end
 
 def full? (board) 
   board.all? {|string| (string == "X" ||string == "O")} 
 end
 
 def draw? (board)
   if full?(board) && !won?(board)
     true
   end
 end
 def over? (board)
   if won?(board) || draw?(board) || full?(board)
     true
   end
 end
     
 def winner (board)
   if won?(board)
   winner = won?(board)
  board[winner[0]]
   else
     nil
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
 