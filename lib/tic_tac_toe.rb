require "pry"

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

def input_to_index(user_input)
    converted_input = user_input.to_i - 1
end

def move(board, index, player)
    board[index] = player
end

def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
    if board[index] == "X" || board[index] == "O"
        false
    elsif index >  -1 && index < 9
        true
    else
        false 
end
end

def turn_count(board)
    counter = 0
    board.each do |board_space|
        if board_space == "X"
        counter += 1
        elsif board_space == "O"
        counter += 1
        end
    end
counter 
end

def current_player(board)
    if turn_count(board).to_i % 2 == 0
        return "X"
    elsif turn_count(board).to_i % 2 == 1
        return "O"
    end
end

def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index)
        move(board, index, player = "X")
    else
        turn(board)
    end
    display_board(board)
end

def play(board)
    counter = 0
    while counter < 9
      turn(board)
      counter += 1
    end
  end
 
def won?(board)
WIN_COMBINATIONS.detect do |winning_combo|
  position_taken?(board, winning_combo[0]) && (board[winning_combo[0]] == board[winning_combo[1]] && board[winning_combo[1]] == board[winning_combo[2]])
end
end

def full?(board)
  board.all?{|space| space == "X" || space =="O"}
end

def draw?(board)
  #board.all?{|space| space == "X" || space =="O"} 
  full?(board) && !won?(board)
end

def over?(board)
  board.all?{|space| space == "X" || space =="O"} || won?(board)
end

def winner(board)
if wins = won?(board)
  board[wins[0]]
end
end


