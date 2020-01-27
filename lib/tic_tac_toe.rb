#Tic tac toe game#


#Constant for the winning combinations
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

#actual game board with (board being an array you can store the value or moves)
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#converts user input from string to integer
def input_to_index(user_input)
  user_input.to_i - 1
end

#move takes in 3 arguments board position, index , and which player is going
def move(board, index, current_player)
  board[index] = current_player
end
#position_taken takes 2 arguments board and index, checks to see if the position is taken
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
#valid_move checks to see if what the users move is, is valid
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end
#turn_count runs method board.each on index to update the turn count
def turn_count(board)
  turn = 0
  board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end

#current_player creates local var num_turns = turn_count(board), if num_turns is even "O" went
def current_player(board)

  num_turns = turn_count(board)
  if num_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

#turn checks to see if a players turn is valid, if it is then calls method move and updates board
#else it re-runs turn prompting user to go again
def turn(board)
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index)
    player_token = current_player(board)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end
#won? checks winning combinations by cross referencing the  constant,
def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

#full? checks if board is full
def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

#draw? checks(board) for a draw
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

#checks if the game is over by comparing method won vs draw
def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

#determines the winner 
def winner (board)
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

#play method runs helper method over to check if game is over, and then runs turn, the checks if 
#won congratualate the winner and if draw output Cats game
def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end