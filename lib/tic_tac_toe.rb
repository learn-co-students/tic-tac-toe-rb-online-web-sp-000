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

def input_to_index(input)
    return input.to_i - 1
end

def move(board, index, char)
    board[index] = char
    return board
end

def position_taken?(board, index)
    return (board[index] == "X" || board[index] == "O")
end

def valid_move?(board, index)
    if position_taken?(board, index)
        return false
    elsif index > -1 && index < 8
        return true
    end
end

def turn_count(board)
    count = 0
    board.each {|cell| cell != " " ? count +=1 : count == count}
    return count
end

def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn(board)
    player = current_player(board)
    puts "Where do you want to go?"
    puts "Choose cell 1-9"
    answer = gets.strip
    index = input_to_index(answer)
    
    valid_move?(board, index) ? move(board, index, player) : turn(board)
end

def won?(board)
    WIN_COMBINATIONS.each do |combo|
        check1 = board[combo[0]]
        check2 = board[combo[1]]
        check3 = board[combo[2]]
        final_check = [check1,check2,check3]
        if final_check.all?{|char| char == check1} && check1 != " "
          return combo
        end
      end
      return false
end

def full?(board)
    return board.none?{|cell| cell == " "}
end

def draw?(board)
    if full?(board) && !won?(board)
        return true
    elsif won?(board)
        return false
    else
        false
    end
end

def over?(board)
    draw?(board) ? true : won?(board) ? true : false
end

def winner(board)
    # return X when X won
    # returns O when O won
    # returns nil when no winner
end