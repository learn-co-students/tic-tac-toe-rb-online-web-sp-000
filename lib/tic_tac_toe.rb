require 'pry'

WIN_COMBINATIONS = [
  [0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],
  [1, 4, 7],[2, 5, 8],[0, 4, 8],[6, 4, 2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  return input.to_i - 1
end

def move(board, index, player)
  return board[index] = player
end

def position_taken?(board, position)
  return !(board[position].nil? || board[position] == " ")
end

def valid_move?(board, position)
  if position_taken?(board, position) || position < 0
    return false
  else
    return true
  end
end

def turn(board)
  make_move = gets.strip
  make_move = input_to_index(make_move.to_i)

  if valid_move?(board, make_move)
    move(board, make_move, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count{|taken| taken=="X"||taken=="O"}
end

def current_player(board)
    return turn_count(board)%2 == 0? "X": "O"
end

def play(board)

end

def won?(board)
  pre = current_player(board) =='X'? "O" : "X"
  won = false
  WIN_COMBINATIONS.each do |comb|
    if board[comb[0]] == pre and board[comb[1]] == pre and board[comb[2]] == pre
      won = true
    end
  end
  won
end

def full?(board)
  return !board.include?(" ")
end

def draw?(board)
  return (!won?(board) and full?(board))
end

def over?(board)
  return (draw?(board) or won?(board))
end

# fix
def winner(board)
  if won?(board)
    current_player(board) == "X"? "O" : "X"
  else
    nil
  end
end
