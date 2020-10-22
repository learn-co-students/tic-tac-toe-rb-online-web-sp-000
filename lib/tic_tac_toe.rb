WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,4,8], # first diagonal
  [2,4,6], # second diagonal
  [0,3,6], # Horizontal 1
  [1,4,7], # Hortizontal 2
  [2,5,8]  # Horizontal 3
]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    fresh_user_input = user_input.to_i
    fresh_user_input -= 1
    return fresh_user_input
  end

  def move(board, index, character)
    board[index] = character
    return board
  end

  def position_taken?(board, index)
    taken = nil
    if (board[index] ==  " " || board[index] == "" || board[index] == nil)
        taken = false
    else
        taken = true
    end    
end

def valid_move?(board, index)

    if position_taken?(board, index)
        true
    elsif index.between?(0, 8)
        spot = true
    else
        spot = false
    end
    spot
end

def turn_count(board)
    board.count { |token| token == 'X' || token == 'O' }
end

def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
        move(board, index, value = current_player(board))
        display_board(board)
    else
        turn(board)
    end
end

def won?(board)

    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
     
      position_1 = board[win_index_1]
      position_2 = board[win_index_2] 
      position_3 = board[win_index_3] 
     
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination 
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
      if board.all?{|index| index == " "} == false
      return false
    end
    end
    
    def full?(board)
      if board.any?{|index| index == " "} == false
      return true
    else
      return false
      end
    end
    
    def draw?(board)
        !won?(board) && full?(board)
      end
    
      def over?(board)
        won?(board) || draw?(board)
      end
    
    def winner (board)
      index = []
      index = won?(board)
      if index == false
        return nil
      else
        if board[index[0]] == "X"
          return "X"
        else
          return "O"
        end
      end
    end


    def play(board)
        until over?(board)
        turn(board)
        end
        if won?(board)
          puts "Congratulations #{winner(board)}!"
        else 
          puts "Cat's Game!"
        end
       end

