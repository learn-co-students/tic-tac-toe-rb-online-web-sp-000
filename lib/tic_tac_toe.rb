WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column win
  [1, 4, 7], # Middle column win
  [2, 5, 8], # Right column win
  [0, 4, 8], # Left to right downward diagonal
  [2, 4, 6]  # Left to right upward diagonal
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

def move(board, index, player_character)
    board[index] = player_character
end

def position_taken?(board, index)
    if board[index] != " " && board[index] != ""
        true
    else
        false
    end
end

def valid_move?(board, index)
    if index.between?(0,8) && !position_taken?(board, index)
        true
    else
        false
    end
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index) && turn_count(board).even?
      move(board, index, "X")
      display_board(board)
    elsif valid_move?(board, index) && turn_count(board).odd?
      move(board, index, "O")
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
    counter = 0
    board.each do |board|
        if (board == "X") || (board == "O")
            counter += 1
        end
    end
    counter
end

def current_player(board)
    if turn_count(board).even?
        return "X"
    elsif turn_count(board).odd?
        return "O"
    end
end

def won?(board)
    WIN_COMBINATIONS.detect do |combination|
      board[combination[0]] == board[combination[1]] && 
      board[combination[1]] == board[combination[2]] && 
      position_taken?(board, combination[0])
    end
end

def full?(board)
    board.all? do |element| 
    element == "X" || element == "O"
    end
end

def draw?(board)
    if full?(board) && !won?(board)
        true
    else
        false
    end
end

def over?(board)
    won?(board) || full?(board) || draw?(board)
end

def winner(board)
    if won?(board)
      board[won?(board).first]
    else
      nil
    end
end

def play(board)
  
    until over?(board)
      turn(board)
      won?(board)
    end
    
    if winner(board)
        puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
        puts "Cat's Game!"
    end

end