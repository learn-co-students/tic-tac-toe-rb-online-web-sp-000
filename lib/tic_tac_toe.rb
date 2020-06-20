def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #top row 
  [3,4,5], #mid row 
  [6,7,8], #bot row 
  [0,3,6], #left col 
  [1,4,7], #mid col 
  [2,5,8], #right col
  [0,4,8], #left diag 
  [2,4,6] #right diag 
  ]


def won?(board)
 WIN_COMBINATIONS.detect do |win_combo|
   location1 = win_combo[0]
   location2 = win_combo[1]
   location3 = win_combo[2]
   board[location1] == board[location2] && board[location2] == board[location3] && board[location1] != " "
 end
end

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

def valid_move?(board, index)
  spot = nil
  if index.between?(0, 8) && !(position_taken?(board, index))
    spot = true
  else 
    spot 
  end
  spot

end

def position_taken?(board, x)
  taken = nil
  if (board[x] ==  " " || board[x] == "" || board[x] == nil)
     taken = false
  else
     taken = true
  end
  taken
end

def move(board, index, token)
  board[index] = token
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, token= "#{current_player(board)}" )
      display_board(board)
    else
      turn(board)
    end
end

def full?(board)
  !board.any? {|x| x == " "}
end

def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  elsif won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true 
  else 
    return false
  end
end

def turn_count(board)
  moves= []
  counter = 0 
  board.each do |space|
    if space == "X" || space == "O"
      counter +=1 
      puts "Space Taken."
      moves.push(1)
    else 
      puts "Open Space."
      counter +=1
    end
  end
  moves.length.to_i 
end

def current_player(board)
  x = turn_count(board)
  if x % 2 == 0 
    return "X"
  else 
    return "O"
  end
end

def winner(board)
  if win_combo = won?(board)
    board[win_combo.first]
  end
end

def play(board)
  
  until over?(board)
    turn(board) 
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else 
    puts "Cat's Game!"
  end
end