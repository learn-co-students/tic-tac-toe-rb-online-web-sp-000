
WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],  
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
    user_input = user_input.to_i
    user_input >= 1 && user_input <= 9? index = user_input - 1 : -1
end
  
def move(board, index, player_character)
    board[index] = player_character if index >= 0 && index <= 8
    board
end

def position_taken?(board, index)
    if board[index] == nil || board[index] == " "  
        false
    elsif board[index] == nil
        false
    else
        true
    end
end
    
def valid_move?(board, index)
    index >= 0 && index <= 8 && !position_taken?(board, index)
end

def turn_count(board)
    play = board.select {|token| !token.include?(" ")}
    play.count
end

def current_player(board)
    if turn_count(board).even? 
        player = "X" 
    else 
        player = "O"
    end
    return player
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
        token = current_player(board)
        move(board, index, token)
        display_board(board)
    else
      turn(board)
    end
end


def won?(board)

    if board[0] == "X" && board[1] == "X" && board[2] == "X" || board[0] == "O" && board[1] == "O" && board[2] == "O"
      WIN_COMBINATIONS[0]
    elsif board[3] == "X" && board[4] == "X" && board[5] == "X" || board[3] == "O" && board[4] == "O" && board[5] == "O"
        WIN_COMBINATIONS[1]
    elsif board[6] == "X" && board[7] == "X" && board[8] == "X" || board[6] == "O" && board[7] == "O" && board[8] == "O"
        WIN_COMBINATIONS[2]
    elsif board[0] == "X" && board[3] == "X" && board[6] == "X" || board[0] == "O" && board[3] == "O" && board[6] == "O"
        WIN_COMBINATIONS[3]
    elsif board[1] == "O" && board[4] == "O" && board[7] == "O" || board[1] == "X" && board[4] == "X" && board[7] == "X"
        WIN_COMBINATIONS[4]
    elsif board[2] == "O" && board[5] == "O" && board[8] == "O" || board[2] == "X" && board[5] == "X" && board[8] == "X"
        WIN_COMBINATIONS[5]
    elsif board[2] == "O" && board[4] == "O" && board[6] == "O" || board[2] == "X" && board[4] == "X" && board[6] == "X"
        WIN_COMBINATIONS[6]
    elsif board[0] == "X" && board[4] == "X" && board[8] == "X" || board[0] == "O" && board[4] == "O" && board[8] == "O"
        WIN_COMBINATIONS[7]
    else
      
    end
end
  
  
def full?(board)
    if board.any?(" ")
      false
    elsif !board.all?(" ")
      true
    end
end
  
  
def draw?(board)
    true if full?(board) && !won?(board)
end
  
  
def over?(board)
    if won?(board) || draw?(board)
        return true
    else
        return false
    end
end
  
def winner(board)
    if board[1] == "O" && board[4] == "O" && board[7] 
      return "O"
    elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
      return "X"
    else
      return nil
    end
end

def play(board)
   until over?(board) == true
        turn(board)
   end
    
    if draw?(board)
        puts "Cat's Game!"
    elsif   (board[0] == "X" && board[1] == "X" && board[2] == "X") || (board[3] == "X" && board[4] == "X" && board[5] == "X") || (board[6] == "X" && board[7] == "X" && board[8] == "X") || (board[0] == "X" && board[3] == "X" && board[6] == "X") || (board[1] == "X" && board[4] == "X" && board[7] == "X") || (board[2] == "X" && board[5] == "X" && board[8] == "X") || (board[2] == "X" && board[4] == "X" && board[6] == "X") || (board[0] == "X" && board[4] == "X" && board[8] = "X")
        
        puts "Congratulations X!"

    elsif (board[0] == "O" && board[1] == "O" && board[2] == "O") || (board[3] == "O" && board[4] == "O" && board[5] == "O") || (board[6] == "O" && board[7] == "O" && board[8] == "O") || (board[0] == "O" && board[3] == "O" && board[6] == "O") || (board[1] == "O" && board[4] == "O" && board[7] == "O") || (board[2] == "O" && board[5] == "O" && board[8] == "O") || (board[2] == "O" && board[4] == "O" && board[6] == "O") || (board[0] == "O" && board[4] == "O" && board[8] = "O")
        puts "Congratulations O!"
    
    end
end