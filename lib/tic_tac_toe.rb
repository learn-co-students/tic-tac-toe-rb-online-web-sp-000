

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
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

def move(board, index, player)
    board[index] = player
end

def position_taken?(board, index)
    board[index].include?("X") || board[index].include?("O")
end

def valid_move?(board, index)
    !position_taken?(board, index) && (0..8).include?(index)
end

def turn_count(board)
    board.count("X") + board.count("O")
end

def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn(board)
    puts "Please enter 1-9: "
    input = gets.chomp
    index = input_to_index(input)
    
    if !valid_move?(board, index)
      puts "Please enter 1-9: "
      input = gets.chomp
      index = input_to_index(input)
    else
      move(board, index, current_player(board))
      display_board(board)      
    end
end

def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
        if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" || board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
            return win_combo
        end
    end
    false
end

def full?(board)
    !board.include?(" ")
end

def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
    won?(board) || full?(board)
end

def winner(board)
    if won?(board)
        board[won?(board)[0]]
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
    else draw?(board) == true
      puts "Cat's Game!"
    end
  end