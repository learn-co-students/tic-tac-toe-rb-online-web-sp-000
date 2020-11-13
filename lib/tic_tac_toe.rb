WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [3, 4, 5],
    [2, 4, 6],
    [6, 7, 8]
]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} " 
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    index = input.to_i - 1
end

def move(board, index, token)
    if valid_move?(board, index)
        board[index] = token
    else
        "Sorry, that is not a valid move"
        turn(board)
    end
end

def position_taken?(board, index)
    board[index] == "X" || board[index] == "O" ? true : false
end

def valid_move?(board, index)
    true if (0..8).include?(index) && !position_taken?(board, index)
end

def turn_count(board)
    board.select {|index| index != ' '}.count
end

def current_player(board)
    turn_count(board).even? ? "X" : "O"
end

def turn(board)
    puts "Please enter a number 1-9:"
    input = gets.strip
    index = input_to_index(input)
    move(board, index, current_player(board))
end

def won?(board)
    WIN_COMBINATIONS.any? do |combo|
        combo.all?{|index| board[index] == "X"} || combo.all?{|index| board[index] == "O"}
    end
end

def full?(board)
    board.any? {|index| index == " "} ? false : true
end

def draw?(board)
    true if full?(board) && !won?(board)
end

def over?(board)
    true if won?(board) || draw?(board)
end

def winner(board)
    if WIN_COMBINATIONS.any? {|combo| combo.all?{|index| board[index] == "X"}}
        "X"
    elsif WIN_COMBINATIONS.any? {|combo| combo.all?{|index| board[index] == "O"}}
        "O"
    end
end

def play(board)
    turn(board) until over?(board)
    if winner(board)
        puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
        puts "Cat's Game!"
    end
end