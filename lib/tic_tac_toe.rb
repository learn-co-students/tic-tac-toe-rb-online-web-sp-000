WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(users_input)
    users_input.to_i - 1
end


def move(array, index, player)
  array[index] = player
end

def position_taken?(board, index)
    if board[index] == " "
        false
    elsif board[index] == ""
        false
    elsif board[index] == nil
        false
    elsif board[index] == "X" || "O"
        true

    end
end


def valid_move?(board, index)
    if index.between?(0,8) && !position_taken?(board, index)
       return true
    end
 end


def turn_count(board)
    counter = 0
    board.each do |index|
       if index == "X" || index == "O"
       counter += 1
       puts counter
    end
 end

 counter
 end


 def current_player(board)
    if turn_count(board) % 2 == 0
       return "X"
    elsif turn_count(board) % 2 == 1
       return "O"
    else
    end
 end

 def turn(board)
    puts "Please enter 1-9:"
    users_input = gets.strip
    index = input_to_index(users_input)
    if valid_move?(board, index) == true
        move(board, index, current_player(board))
        display_board(board)

    else
        turn(board)
    end
end

def won?(board)
    WIN_COMBINATIONS.find do |win_combination|
      if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
        return win_combination
      elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
        return win_combination
      else
        false
      end
    end
  end

def full?(board)
    board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
    if !won?(board) && full?(board)
      return true
    else won?(board)
        return false
    end
  end

def over?(board)
    if draw?(board) || won?(board) || full?(board)
        return true
    end
end

def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    end
end


def play(board)
    until over?(board)
       turn(board)
    end
    if won?(board)
       winner(board) == "X" || winner(board) == "O"
       puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
       puts "Cat's Game!"
    end
 end
 
