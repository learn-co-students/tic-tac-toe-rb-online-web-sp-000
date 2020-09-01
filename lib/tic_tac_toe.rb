WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board(board)
  puts " #{board[0]} "+"|"+" #{board[1]} "+"|"" #{board[2]} "
  puts "-----------"
  puts " #{board[3]} "+"|"+" #{board[4]} "+"|"" #{board[5]} "
  puts "-----------"
  puts " #{board[6]} "+"|"+" #{board[7]} "+"|"" #{board[8]} "
end

def input_to_index(input)
  index = input.to_i
  index - 1
end

def move(board, index, value="X")
  board[index] = value
end

def input_to_index(input)
  index = input.to_i
  index - 1
end

def move(board, index, value)
  board[index] = value
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
  while !valid_move?(board,index)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  end
  cur_pl = current_player(board)
  move(board, index, cur_pl)
  display_board(board)
end

def turn_count(board)
  count = 0
  board.each do  |item|
    if !(item == " " || item == "" )
      count += 1
    end
  end
  return count
end

def current_player(board)
  turns = turn_count(board)
  return turns % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") ||
    (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
 end
end

def full?(board)
  board.select{ |item| item != " " && !item.nil? && item != ""}.size == 9
end

def draw?(board)
  !(won?(board) || !full?(board))
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if(won?(board))
    if( WIN_COMBINATIONS.detect {|win_combination|
      (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") })
      return  "X"
    else
      return "O"
    end
  end
   nil
end
def play(board)
  while !over?(board)
    turn(board)
  end
  if(won?(board))
    winner = winner(board);
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end
