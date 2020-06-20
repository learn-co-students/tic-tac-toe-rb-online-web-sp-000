WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    if input.to_i
        return input.to_i - 1
    else 
        return -1
    end
end

def move(board, index, token)
    board[index] = token
end

def position_taken?(board, index)
    if board[index] != "" && board[index]  != " "
        return true
    else 
        return false
    end
end

def valid_move?(board, index)
    index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
        move(board, index, token = current_player(board))
        display_board(board)
    else
        turn(board)
    end
end

def turn_count(board)
    x = 0
    board.each do |pos|
        if pos != "" && pos != " "
            x += 1
        end
    end
    return x
end

def current_player(board)
    if turn_count(board).even?
        return "X"
    else 
        return "O"
    end
end

def won?(board)
    WIN_COMBINATIONS.each do |combo|
        pos1 = combo[0]
        pos2 = combo[1]
        pos3 = combo[2]
        if board[pos1] == board[pos2] && board[pos2] == board[pos3] && board[pos1] != "" && board[pos1] != " "
          return combo
        end
      end
      return false
end

def full?(board)
    board.each do |pos|
        if pos == "" || pos == " "
          return false
        end
      end
      return true
end

def draw?(board)
    if full?(board) && !won?(board)
        return true
    else
        return false
    end
end

def over?(board)
    if draw?(board) || won?(board)
        return true
    else
        return false
    end
end

def winner(board)
    if over?(board) && won?(board)
        return board[won?(board)[0]]
    else
        return nil
    end
end

def play(board)
    while !over?(board)
        turn(board)
    end
    if draw?(board)
        puts "Cat's Game!"
    else
        puts "Congratulations #{winner(board)}!"
    end
end