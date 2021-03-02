#display_board
board = ["   ","   ","   ","   ","   ","   ","   ","   ","   "]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input_to_index
def input_to_index(user_input)
    user_input.to_i - 1
end

#move
def move(board, index, current_player)
    board[index] = current_player
end

#position_taken?  
def position_taken?(board, location)
    board[location] != " " && board[location] != ""
end

#valid_move?
def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
end

#turn_count
def turn_count(board)
    board.count{|token| token == "X" || token == "O"}
end

#current player
def current_player(board)
    turn_count(board).even? ? "X" : "O"
end

#turn
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

#play
def play(board)
    turn(board) until over?(board)
    if draw?(board)
        puts "Cat's Game!"        
    elsif won?(board)
        puts "Congratulations #{winner(board)}!"
    end
end

#WIN_COMBINATIONS
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,4,6],
    [2,5,8]
].freeze

#won?
def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(board, combo[0])
    end
end

#full?
def full?(board)
    board.all?{|token| token == "X" ||token == "O"}
end

#draw?
def draw?(board)
    full?(board) && !won?(board)
end

#over?
def over?(board)
    won?(board) || draw?(board)
end

#winner
def winner(board)
    if winning_combo = won?(board)
      board[winning_combo.first]
    end
end
