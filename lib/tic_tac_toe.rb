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
    user_input.to_i - 1
end

def move(board,index,value)
    board[index] = value
end

def position_taken?(board,index)
    if board[index] == " " || board[index] == ""
        return false
    elsif board[index] == nil
        return false
    elsif board[index] == "X" || board[index] == "O"
        return true
    end
end

def valid_move?(board,index)
    if index.between?(0,8) && position_taken?(board,index) == false
        return true
    else
        return false
    end
end

def turn_count(board)
    counter = 0
    board.each do |turn|
        if turn == "X" || turn == "O"
            counter += 1
        end
    end
    return counter
end

def current_player(board)
    if turn_count(board) % 2 == 0
        return "X"
    else 
        return "O"
    end
end

def turn(board)
    puts "Choose a spot between 1-9."
    input = gets.strip 
    index = input_to_index(input)
    if valid_move?(board,index) == true
        current_token = current_player(board)
        move(board,index, current_token)
        display_board(board)
    else
        turn(board)
    end
end

def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
        win_index_1 = win_combo[0]
        win_index_2 = win_combo[1]
        win_index_3 = win_combo[2]
        
        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combo
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combo
        end
    end
    return false
end



def full?(board)
    board.all? {|index| index == "X" || index == "O"}
  end

def draw?(board)
    if !won?(board) && full?(board)
        return true
    end
end

def over?(board)
    if won?(board) || draw?(board) || full?(board)
        return true
    end
end

def winner(board)
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

def play(board)
    until over?(board) == true
        turn(board)
    end
    if winner(board) == "X"
        puts "Congratulations X!"
    elsif winner(board) == "O"
        puts "Congratulations O!"
    elsif draw?(board) == true
        puts "Cat's Game!" 
    end
end