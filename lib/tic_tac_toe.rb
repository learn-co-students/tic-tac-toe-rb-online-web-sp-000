# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5], # Middle row
[6,7,8], # Bottom row

[0,3,6], # Left column
[1,4,7], # Middle column
[2,5,8], # Right column

[0,4,8], # Left diagnol
[2,4,6]  # Right diagnol
]
def won?(board)
   WIN_COMBINATIONS.each {|win_combination|

    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3


    if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination # return the win_combination indexes that won.

      end
    }
    return false
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


  def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end


  def move(board, index, current_player)
    board[index] = current_player
  end

  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

  def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"
  end


  def turn_count(board)
      count = 0
      board.each do |spaces|
        if spaces == "X" || spaces == "O"
          count += 1
        end
      end
    return count
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  if valid_move?(board, index)
    p_token = current_player(board)
    move(board, index, p_token)
    display_board(board)
  else
    turn(board)
    end
  end

  def full?(board)
    board.all? {|cell| cell == "X" || cell == "O"}
  end


  def draw?(board)
    if !won?(board) && full?(board)
      return true
    else
      return false
    end
  end


  def over?(board)
    if won?(board) || draw?(board)
      true
    else
      false
    end
  end

 def winner(board)
   player = []
   player = won?(board)
   if player == false
     return nil
   else
     if board[player[0]] == "X"
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

    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"

    end
  end
