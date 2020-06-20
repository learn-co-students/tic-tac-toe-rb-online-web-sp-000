# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


#display_board - Define a method that prints the current board representation based on the board argument passed to the method.

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


#input_to_index

def input_to_index(input)
 index=input.to_i - 1
end


#move

def move(board,index,marker)
  board[index]=marker
end


#position_taken?

def position_taken?(board,index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    false
   else
    true
  end
end


#valid_move?

def valid_move?(board,index)
 if index.between?(0,8) && !position_taken?(board,index)
   true
 else
  false
 end
end


#turn 

def turn(board)
  puts "Please enter 1-9:"
  input=gets.strip
  input=input_to_index(input)
  if valid_move?(board,input)== true
    move(board,input,current_player(board))
    display_board(board)
   else
     puts "Invalid move, try again!"
     turn(board)
   end
  end



#turn_count

def turn_count(board)
  counter=0
    board.each do |space|
    if space !=" "
      counter +=1
    end
  end
counter
end


#current_player

def current_player(board)
  turns = turn_count(board)
  if turns % 2 == 0
    return "X"
  else
    return "O"
  end
end


#won?

def won?(board)
  WIN_COMBINATIONS.each do|win|
    if (board[win[0]] == 'X' && board[win[1]] == 'X' && board[win[2]] == 'X') || (board[win[0]] == 'O' && board[win[1]] == 'O' && board[win[2]] == 'O')
      return win
    end
  end
  false
end


#full

def full?(board)
  board.all? {|square| square == "X" || square == "O"}
end


#draw?

def draw?(board)
  !won?(board) && full?(board)
end


#over?

def over?(board)
  won?(board) || draw?(board)
end


#winner

def winner(board)
    who_wins = won?(board)
    if who_wins
      board[who_wins[0]]
    else
        nil
    end
end

#play 

def play(board)
  while over?(board) == false
    turn(board)
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else 
  puts "Cat's Game!"
  end
end
#have never heard term "cat's game"
