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

def position_taken?(board, index)
    board[index] == " " || board[index] == "" || board[index] == nil ? false : true
end

def valid_move?(board, index)
    if position_taken?(board, index)
        false
    elsif index.between?(0,8)
        true
     end
end

def current_player(board)
    turn_count(board).even? ? "X" : "O"
end

def move(board, index, current_player)
    board[index] = current_player
  end

def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index)
        move(board, index, current_player(board))
        display_board(board)
    else
        turn(board)
    end
end

def turn_count(board)
    counter = 0
    board.each do |e| 
        if e == "O" || e == "X" 
            counter += 1
        end
    end
    counter
end

def won?(board)
    WIN_COMBINATIONS.detect do |arr|
      board[arr[0]] == board[arr[1]] &&
      board[arr[1]] == board[arr[2]] &&
      position_taken?(board, arr[0])
    end
end
  
def full?(board)
    board.all? {|e| e == "O" || e == "X"}
end
  
def draw?(board)
    !(won?(board)) && full?(board)
end
  
def over?(board)
    won?(board) || draw?(board)
end
  
def winner(board)
    won?(board) ? board[won?(board)[0]] : nil
end

def play(board)
    turn(board) until over?(board)
    if over?(board)
        if won?(board)
            congratulate(board)
        # puts "Congratulations #{winner(board)}!"
        elsif draw?(board)
            puts "Cat's Game!"
        end
    end
end

def congratulate(board)
    puts "Congratulations #{winner(board)}!"
    # Not sure having this as a discrete method helps me any...
end

