# stores the winning combinations in an array
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #diagonal from zero
  [2,4,6], #diagonal from two
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8] #right column
]

# displays the current state of the board
def display_board(board)
  row1 = " #{board[0]} | #{board[1]} | #{board[2]} "
  row2 = " #{board[3]} | #{board[4]} | #{board[5]} "
  row3 = " #{board[6]} | #{board[7]} | #{board[8]} "
  line = "-----------"

  puts row1
  puts line
  puts row2
  puts line
  puts row3

end

# converts user input to an index value
def input_to_index(input)
  num = input.to_i - 1
  num
end

# updates the board array with the value of the user's move
def move(board, i, token)
  board[i] = token
  board
end

# checks if the chosen position on the board is occupied
def position_taken?(board, i)
  if board[i] == " " || board[i] == "" || board[i] == nil
    return false
  elsif board[i] == 'X' || board[i] == 'O'
    return true
  end
end


# checks if the user's move is valid meaning it is present on the game board and not already filled with a token
def valid_move?(board, i)
  if position_taken?(board, i) == false && i.between?(0,8) == true
    return true
  else
    return false
  end
end

# encapulates the logic of a single complete turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  isvalid = valid_move?(board, index)

  if isvalid == true
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Sorry, invalid move :("
    turn(board)
  end
end

# returns the number of turns that have been played
def turn_count(board)
  counter = 0
  board.each do |char|
    if char == 'X' || char == 'O'
      counter += 1
    end
  end
  counter
end

# determines who is the current player (X or O)
def current_player(board)
  turn_count(board) % 2 == 1 ? 'O' : 'X'
end

# returns the winner combination or returns false if there is no winner combination
def won?(board)

  WIN_COMBINATIONS.each do |win_arr|

    yes_x = win_arr.all? do |i|
      board[i] == 'X'
    end

    if yes_x == true
      return win_arr
    end

    yes_o = win_arr.all? do |i|
      board[i] == 'O'
    end

    if yes_o == true
      return win_arr
    end
  end

  return nil

end

# returns true if the whole board is full
def full?(board)
  board.none? {|el| el == "" || el == " "}
end


# returns true if the board is full but the game has not been won, returns false if the game has not been won and the board is not full or if the game is won
def draw?(board)

  if full?(board) == true
    if won?(board) == nil
      return true
    else
      return false
    end
  else
    return false
  end

end

# returns true if the board has been won, is draw or is full
def over?(board)

  if won?(board) != nil || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end

end

# returns the winner token
def winner(board)

  if won?(board) != nil
    winner_arr_firstindex = won?(board)[0]
    if board[winner_arr_firstindex] == "X"
      return "X"
    elsif board[winner_arr_firstindex] == "O"
      return "O"
    end
  end

end


def play(board)

  until over?(board) == true
    turn(board)
  end

  if over?(board) == true
    if won?(board) != nil
      winner_token = winner(board)
      puts "Congratulations #{winner_token}!"
    elsif draw?(board) == true
      puts "Cat's Game!"
    end
  end

end
