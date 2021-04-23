

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

def display_board(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
 index = input.to_i - 1
 return index
 end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
     WIN_COMBINATIONS.each do |combination|
      d = board[combination[0]]
      e = board[combination[1]]
      f = board[combination[2]]
      if d == e && e == f && d != " "
        return combination
      end
    end
combination = false
  end


def update_array_at_with(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
index.between?(0, 8) && !position_taken?(board, index)
end

def move(board, index, current_player)
  update_array_at_with(board, index, current_player)
end

def turn(board)
  puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
    if !valid_move?(board, index)
       turn(board)
    else
     move(board, index, current_player(board))
     display_board(board)
 end
 end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
    draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
  return board[won?(board)[1]]
end
end

def play(board)
  turn(board) until over?(board)
 if draw?(board)
    puts "Cat's Game!"
  end
 if won?(board)
    puts "Congratulations #{winner(board)}!"
 end
end
