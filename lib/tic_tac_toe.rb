def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Helper Methods
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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  if over?(board) == true
    if draw?(board) == true
      puts "Cat's Game!"
    end
    puts "Congratulations #{winner(board)}!"
  else
    turn(board)
    play(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |i|
    if i != " "
      counter += 1
    end
  end
return counter
end

def current_player(board)
  current_turn = turn_count(board)
  if current_turn % 2 == 0
    return "X"
  else
    return "O"
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

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
       #binding.pry
       return win_combination
    end
  end
  return false
end

  def full?(board)
    if board.any? {|index| index == " "}
    elsif won?(board) == false
        return true
    end
  end

  def draw?(board)
    if full?(board) == true
      if won?(board) == false
        true
      end
    end
  end

  def over?(board)
    if draw?(board) == true
        true
    elsif won?(board) != false
        true
    end
  end

  def winner(board)
    winner = won?(board)
    if winner
      win_index_1 = winner[0]
      position_1 = board[win_index_1]
      position_1
    end
  end
