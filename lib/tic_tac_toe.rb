WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5,],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
    puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  current_player = current_player(board)
  if valid_move?(board, index)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else 
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
 
  def won?(board)
WIN_COMBINATIONS.each { |win_combination|
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
    if position_1 == ("X") && position_2 == ("X") && position_3 == ("X")
    return win_combination # return the win_combination indexes that won.
  elsif position_1 == ("O") && position_2 == ("O") && position_3 == ("O")
  return win_combination
 end
}
return false
end

def turn_count(board)
  counter = 0
  board.each do |turn|
if turn != " "
  counter += 1
end
end
  counter
end

def current_player(board)
  (turn_count(board)) % 2 == 0 ? "X" : "O"
end

def play(board)
  winner = winner(board)
# until the game is over
until (over?(board))
turn(board)
end
if won?(board)
 puts ("Congratulations #{winner(board)}!")
  elsif draw?(board)
  puts ("Cat's Game!")
  elsif full?(board)
  puts ("Cat's Game!")
end
end