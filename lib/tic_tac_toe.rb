WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
WIN_COMBINATIONS.each do |combo|
#for each combo in WIN_COMBINATIONS do
  position_1=board[combo[0]]
  position_2=board[combo[1]]
  position_3=board[combo[2]]
if (position_1=="X" && position_2=="X"&& position_3=="X") ||( position_1=="O" && position_2=="O" && position_3=="O")
  return combo
end
end
false
end

def full?(board)
  board.none?{|space| space==" "}
end

def draw? (board)
  if full?(board) && !won?(board)
    true
  else false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else false
  end
end

def winner(board)
  if won?(board)
    winner=won?(board)[0]
    return board[winner]
  end
end

def  turn_count(board)
  count=0
  board.each do |value|
    if !(value==" ")
      count+=1
  end
  end
  return count
  end

def current_player(board)
  turns=turn_count(board)
  turns.even?? "X": "O"
  # if turns%2==0
   #    "X"
   #else "O"
   # end

end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  if input.to_i.to_s==input
     return input.to_i-1
   else return -1
  end
end

def valid_move?(board,index)
  if (!(board[index]=="X"))&&(!(board[index]=="O"))&& index.between?(0,8)
    return true
end
end

def move(board,index,value)
  board[index]=value
end

def turn(board)
  puts 'Please enter 1-9:'
  input=gets.strip
  index=input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
  else turn(board)
  end
  display_board(board)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else puts "Cat's Game!"
  end

end
