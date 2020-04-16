WIN_COMBINATIONS = 
[
  [0,1,2], #top_row_win 
  [3,4,5], #mid_row_win 
  [6,7,8], #low_row_win 
  [0,3,6], #vertical_left_win 
  [1,4,7], #vertical_center_win
  [2,5,8], #vertical_right_win 
  [0,4,8], #diag_left_to_right_win 
  [2,4,6] #diag_right_to_left_win 
] 
def play(board)
    turn(board) until over?(board)
     if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
end 
  
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

def move(board_array, index, players_character)
    board_array[index] = players_character 
end 

def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
end 

def turn(board)
    puts 'Please enter 1-9:'
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
    arr = (board.select{|tokens| tokens == "X" || tokens == "O"}).count
end 

def current_player(board)
    if turn_count(board).even?
        "X"
    elsif turn_count(board).odd?
        "O"
    end 
end 

def won?(board)
    WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" 
         return combo 
      end
      if board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" 
         return combo 
      end 
    end 
    false   
  end 

def full?(board)
  board.all?{ |position| position == "X" || position == "O"}
end 

def draw?(board)
 full?(board) && !won?(board)
end 

def over?(board)
  won?(board) || draw?(board)
end 

def winner(board)
    WIN_COMBINATIONS.each do |combo|
        if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]]  == "X"
            return "X"
        elsif
            board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]]  == "O"
                return "O"
        elsif !won?(board)
            return nil
      end 
    end 
end 

