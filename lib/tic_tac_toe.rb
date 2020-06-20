#WIN_COMBINATIONS
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]
  
  #display_board
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  #input_to_index
  def input_to_index(user_input)
    user_index = user_input.to_i - 1
  end
  
  #move
  def move(board,user_index,current_player)
    board[user_index] = current_player
  end
  
  #position_taken?
  def position_taken?(board,user_index)
    board[user_index] == "X" || board[user_index] == "O"
  end
  
  #valid_move?
  def valid_move?(board,user_index)
    user_index.between?(0,8) && !position_taken?(board,user_index)
  end
  
  #turn
    def turn(board)
      puts "Please choose a number between 1-9:"
      user_input = gets.strip
      user_index = input_to_index(user_input)
      if valid_move?(board,user_index)
        player_token = current_player(board)
        move(board,user_index,player_token)
        display_board(board)
      else
        turn(board)
      end
    end
  
  #turn_count
  def turn_count(board)
    turn = 0
    board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    return turn
  end
  
  #current_player
  def current_player(board)
    num_turns = turn_count(board)
    if num_turns % 2 == 0 
      player = "X"
    else
      player = "O"
    end
    return player
  end
    
  #won?
  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      index_0 = win_combination[0]
      index_1 = win_combination[1]
      index_2 = win_combination[2]
      
      position_1 = board[index_0]
      position_2 = board[index_1]
      position_3 = board[index_2]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
  end
  
  #full?
  def full?(board)
    board.all? do |index|
      index == "X" || index == "O"
    end
  end
  
  #draw?
  def draw?(board)
    if !won?(board) && full?(board)
      return true
    else
      return false
    end
  end
  
  #over?
  def over?(board)
    if won?(board) || draw?(board) || full?(board)
      return true
    else
      return false
    end
  end
  
  #winner
  def winner(board)
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
  
  #play
  def play(board)
    until over?(board)
      turn(board)
    end
    
    if won?(board)
      winner_name = winner(board)
      puts "Congratulations #{winner_name}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end
      
    
  
        
      
      
  
  