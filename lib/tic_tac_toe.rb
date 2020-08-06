WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row

  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column

  [0,4,8], #NW - SE
  [2,4,6] #NE - SW
]

def display_board(board = [" "," "," "," "," "," "," "," "," "])
  line = "-----------"
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts line
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts line
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move (board, index, token)
  board[index] = token
  board
end

def position_taken?(board, index)
  position = board[index]

  if position == "X" || position == "O"
    true
  else
    false
  end
end

def valid_move?(board, index)
  #if (input_in_range?(index) && (!(position_taken?(board, index))))
  if ((index > -1) && (index < 9) && (!(position_taken?(board, index))))
    return true
    else
      false
  end
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
  count = board.select{|position| position == "X" || position == "O"}
  count.length
end

def current_player(board)
  player = turn_count(board).even? ? "X" : "O"
  player
end

def won?(board)
  board_win = false
# Iterate over the possible win combinations defined in `WIN_COMBINATIONS` and
# check if the board has the same player token in each index of a winning
# combination.
# enumerate WIN_COMBINATIONS; isolate each win_combo
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    # check if position is taken

    # compare win_combo to corresponding board positions
    if (board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X") || (board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O")
      # if they match, that's a win
      board_win = win_combo
    end
    # if not, keep enumerating
  end
  board_win
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  # returns true if the board has
  # not been won but is full, false if the board is not won and the board is not
  # full, and false if the board is won
  !(won?(board)) && full?(board)
#    true
#  elsif (!(won?(board)) && !(full?(board))) || won?(board)
#    false
#  end
end

def over?(board)
  # eturns true if the board has
  # been won, is a draw, or is full.
  won?(board) || draw?(board)
end

def winner(board)
  # return the token, "X" or "O" that
  # has won the game given a winning board.
  win = won?(board)
  win ? board[win[0]] : nil
end

def play(board)
#  is_over = false
turn(board) until over?(board)
#    if over?(board)
      if won?(board)
        puts "Congratulations #{winner(board)}!"
      elsif draw?(board)
        puts "Cat's Game!"
      end
#      is_over = over?(board)
#    end
#  end
end
