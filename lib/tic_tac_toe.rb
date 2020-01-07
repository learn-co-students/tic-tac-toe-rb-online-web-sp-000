WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
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
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def turn_count(board)
  board.select { |spot| spot == 'X' || spot == 'O' }.size
end

def current_player(board)
  turn_count(board).even? ? 'X' : 'O'
end

def input_to_index(input)
  input.to_i - 1
end

def position_taken?(board, index)
  board[index] != ' '
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def move(board, index, token)
  board[index] = token
end

def turn(board)
  puts "Enter a position from 1-9: "
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
  WIN_COMBINATIONS.each do |win|
    if [['X', 'X', 'X'], ['O', 'O', 'O']].include?([board[win[0]], board[win[1]], board[win[2]]])
      return win
    end
  end
  false
end

def full?(board)
  board.all? { |spot| spot == 'X' || spot == 'O'}
end

def draw?(board)
  if full?(board)
    return true unless won?(board)
  end
  false
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board).first]
  end
  nil
end

def play(board)
  until over?(board)
    turn(board)
  end
  
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end