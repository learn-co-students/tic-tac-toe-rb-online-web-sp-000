WIN_COMBINATIONS = [[0, 1, 2], 
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

def input_to_index(user_input)
    user_input = (user_input.to_i) - 1
end

def move(board, index, character)
    board[index] = character
end

def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
    !position_taken?(board, index) && index.between?(0, 8)
end

def turn_count(board)
    count = 0
    board.each do |pos|
        unless pos == " "
            count += 1
        end
    end
    count
end

def current_player(board)
    if (turn_count(board)) % 2 == 0
        "X"
    else
        "O"
    end
end

def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index)
        move(board, index, current_player(board))
    else
        turn(board)
    end
end

def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]
  
      position_1 = board[index_0]
      position_2 = board[index_1]
      position_3 = board[index_2]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end      
    end
    return false
end

def full?(board)
    !board.include?(" ")
end

def draw?(board)
    unless full?(board)
      false
    else
      unless won?(board)
        true
      else
        false
      end
    end
end

def over?(board)
    if won?(board) || draw?(board) || full?(board)
      true
    else
      false
    end
end

def winner(board)
    index = won?(board)
  
    if index == false
      nil
    elsif board[index[0]] == "X"
      "X"
    else
      "O"
    end
end

def play(board)
    turn(board) until over?(board) 
        if won?(board)
            puts "Congratulations #{winner(board)}!"
        elsif draw?(board)
            puts "Cat's Game!"
        end
end