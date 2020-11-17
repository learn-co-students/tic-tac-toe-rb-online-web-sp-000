WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  converted_input = (user_input.to_i) - 1
end

def move(board, user_input, character)
   board[user_input] = character
end

def position_taken?(board, index)
  if board[index] == "X" or board[index] == "O"
    return true
    else
    return false
  end
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn_count(board)
  turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  return turns
end

def current_player(board)
  turns = turn_count(board)
   if turns % 2 == 0
    return "X"
  else
    return "O"
end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  input = input_to_index(user_input)
  if valid_move?(board, input)
    move(board, input, token = "X")
    display_board(board)
  else
    puts "Please enter 1-9:"
    user_input = gets.strip
    input = input_to_index(user_input)
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
  end
  end
  return false
  end

  def full?(board)
    board.all? {|index| index == "X" || index == "O"}
  end

  def draw?(board)
    if !won?(board) && full?(board)
      return true
    else
      return false
    end
    end

    def over?(board)
      if draw?(board) || full?(board) || won?(board)
        return true
      else
        return false
      end
    end
  def winner(board)
    index = [ ]
    index = won?(board)
    if index == false
      return nil
    elsif board[index[0]] == "X"
        return "X"
      else
        return "O"
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
