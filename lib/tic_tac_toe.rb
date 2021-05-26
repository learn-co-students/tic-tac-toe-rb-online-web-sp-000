WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]


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

def display_board(board)
    separator = "|"
    lines = "-----------"
    puts " #{board[0]} #{separator} #{board[1]} #{separator} #{board[2]} "
    puts "#{lines}"
    puts " #{board[3]} #{separator} #{board[4]} #{separator} #{board[5]} "
    puts "#{lines}"
    puts " #{board[6]} #{separator} #{board[7]} #{separator} #{board[8]} "
end

 def input_to_index(num)
    num.to_i - 1
 end

 def move(board, index, token)
    board[index] = token
 end


def position_taken?(board, index)
    (board[index] != " ") && (board[index] != "") && (board[index] == "X") || (board[index] == "O")
end

def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
    counter = 0
    board.each do |spot|
        if spot == "X" || spot == "O"
        counter += 1
        end
    end
    counter
end



def current_player(board)
    turn_count(board).even? ? "X" : "O"
end


def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
        if valid_move?(board, index)
        move(board, index, token = current_player(board))
        display_board(board)
        else turn(board)
    end
end


=begin
def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, token = current_player(board))
    else
      turn(board)
    end
    display_board(board)
  end
=end

def won?(board)

    WIN_COMBINATIONS.select do |win_combo|
   
     win_index_1 = win_combo[0]
     win_index_2 = win_combo[1]
     win_index_3 = win_combo[2]
   
     position_1 = board[win_index_1] # load the value of the board at win_index_1
     position_2 = board[win_index_2] # load the value of the board at win_index_2
     position_3 = board[win_index_3] # load the value of the board at win_index_3
   
     if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
     end
   end
      return false
end

def full?(board)
    board.all? {|space| !(space.nil? || space == " ")}
  end
  
  def draw?(board)
      full?(board) && !won?(board)
  end
  
  def over?(board)
    won?(board) || draw?(board) || full?(board)
  end
  
  def winner(board)
    if won?(board)
      index = won?(board)
      board[index[0]]
    end
  end

