

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

  # display board
  def display_board(board)
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  # input to index
  def input_to_index(user_input)
      user = user_input.to_i
      user -= 1
    end
  # Board mothod
    def move(board,index,player)
        board[index] = player
      end
  #Position taken method
  def position_taken?(board, index)
      !(board[index].nil? || board[index] == " ")
  end
  # valid move method
  def valid_move?(board, index)
      if position_taken?(board,index) == true
            false
      elsif index < 0 || index > 9
           false
      else
             true
       end
  end
  # Turn method
  def turn(board)
        puts "Please enter 1-9:"
       index = gets.strip
       interger = input_to_index(index)
       valid = valid_move?(board,interger )
       if valid == false
       puts "Please enter 1-9:"
          gets.strip
      else
        playing =  current_player(board)
        move(board,interger,playing)
      end
      puts display_board(board)
  end
  # Turn count method
  def turn_count(board)
      count = 0
      board.each do |player|
         if player == "X" || player == "O"
            count +=1
         end
      end
      count
  end
  # Curren player method
  def current_player(board)
      count = turn_count(board)
      if count % 2 == 0
        "X"
      else
        "O"
      end
  end
  # Won? method
   def won?(board)
          if board[0] == "X" && board[1] == "X" && board[2] == "X" ||   board[0] == "O" && board[1] == "O" && board[2] == "O"
                 WIN_COMBINATIONS[0]
           elsif board[3] == "X" && board[4] == "X" && board[5] == "X" || board[3] == "O" && board[4] == "O" && board[5] == "O"
                 WIN_COMBINATIONS[1]
           elsif board[6] == "X" && board[7] == "X" && board[8] == "X" || board[6] == "O" && board[7] == "O" && board[8] == "O"
                 WIN_COMBINATIONS[2]
           elsif board[0] == "X" && board[3] == "X" && board[6] == "X" || board[0] == "O" && board[3] == "O" && board[6] == "O"
                 WIN_COMBINATIONS[3]
           elsif board[1] == "X" && board[4] == "X" && board[7] == "X" || board[1] == "O" && board[4] == "O" && board[7] == "O"
                WIN_COMBINATIONS[4]
          elsif board[2] == "X" && board[5] == "X" && board[8] == "X"  || board[2] == "O" && board[5] == "O" && board[8] == "O"
                WIN_COMBINATIONS[5]
          elsif board[0] == "X" && board[4] == "X" && board[8] == "X"  || board[0] == "O" && board[4] == "O" && board[8] == "O"
                WIN_COMBINATIONS[6]
          elsif board[6] == "X" && board[4] == "X" && board[2] == "X"  || board[6] == "O" && board[4] == "O"  && board[2] == "O"
               WIN_COMBINATIONS[7]
          else
               nil
    end
        end
    # Full? method
    def  full?(board)
      board_valid = true
      board.all? do |not_emty|
          if not_emty != " "
             board_valid = true
          else
              board_valid = false
          end
      end
      board_valid
    end
    def draw?(board)
    # Won method
    if won?(board).class == Array
         return false
      elsif full?(board) == true
          return true
      else
              false
      end
    end
    # Over method
    def over?(board)
      if full?(board) == true
          true
      elsif full?(board) == true && won?(board).class == Array
          true
      elsif full?(board) == false && won?(board).class == Array
            true
      else
            false
      end
    end

    # Winner method
    def winner(board)
   won = won?(board)
   if won == nil
     return nil
   else
      return board[won[0]]
      puts board[won[0]]
   end
 end
# Play
def play(board)
  counter = 0
  loop do
    counter += 1
       if winner(board) == "O"
          puts "Congratulations O!"
       elsif  winner(board) == "X"
          puts "Congratulations X!"
       elsif draw?(board) == true
          puts "Cat's Game!"
       else
          turn(board)
          over?(board)
          draw?(board)
   end
  if counter >= 10
    break
  end
 end
end
