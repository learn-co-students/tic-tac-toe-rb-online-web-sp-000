#Figured out most. Needed solution branch for some guidance.

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

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '-----------'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '-----------'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
   input =  user_input.to_i
   input - 1
end

def move(board, position, player_token)
 board[position] = player_token
end

def position_taken?(board, position)
    if board[position] == 'X'
        true
    else
        board[position] == 'O'
    end
end

def valid_move?(board, position)
     position.between?(0,8) && !position_taken?(board,position)
end

def turn_count(board)
   turncount = 0
    board.each do |player_character|
        if player_character != " "
            turncount += 1
        end
    end
    turncount
end

def current_player(board)
    if turn_count(board) % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn(board)
    puts "Please enter 1-9:"
      userInput = gets.chomp 
      index = input_to_index(userInput)
      if !valid_move?(board, index)
        turn(board)
      else 
        move(board, index, current_player(board))
      end
    display_board(board)
  end

  def won?(board)
    WIN_COMBINATIONS.detect do |winner|
      board[winner[0]] == board[winner[1]] &&
        board[winner[1]] == board[winner[2]] &&
        position_taken?(board, winner[0])
    end
  end

  def full?(board)
    board.all? do |space_taken|
        if space_taken =="X"
            true
        else
            space_taken =="O"
        end
    end
  end

  def draw?(board)
    !won?(board) && full?(board)
  end

  def over?(board)
    if won?(board)
        true
    else
        draw?(board)
    end
  end

  def winner(board)
    player_wins = won?(board)
    if player_wins
        board[player_wins.first]
    end
  end

  def play(board)
    turn(board) until over?(board)
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end


