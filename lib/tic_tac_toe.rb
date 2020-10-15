WIN_COMBINATIONS = [ 
    [0, 1, 2], 
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 4, 6],
    [2, 5, 8]
  ]

  def display_board(board)

    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    
end

def input_to_index(input)
    index = input.to_i
    index -= 1
end

def move(board, index, player)
    board[index] = player
end

def position_taken?(board, location)
    board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
    puts "please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
        move(board, index, current_player(board))
        display_board(board)
    else
        turn(board)
    end
end

def turn_count(board)
    counter= 0
    board.each do |space|
        if space == "X" || space == "O"
            counter += 1
        end
    end
    return counter
end

def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
    WIN_COMBINATIONS.detect do |win_combination|
    location_1 = win_combination[0]
    location_2 = win_combination[1]
    location_3 = win_combination[2]
  
    board[location_1] == board[location_2] && board[location_2] == board[location_3] && board[location_1] != " "
    end
  end

  def full?(board)
    board.none? do |space|
       space == " "
    end
  end

  def draw?(board)
    !won?(board) && full?(board)
  end
  
  def over?(board)
    won?(board) || draw?(board) || full?(board)
  end
  
  def winner(board) 
    winning_combo = won?(board)
    if winning_combo
    winning_location = winning_combo[0]
    board[winning_location]
    else
      nil
    end
  end

def play(board)
    until over?(board)
      turn(board)
    end
    if won?(board) 
        puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
  end
end
