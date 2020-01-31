WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
user_input = user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index =index.to_i
   if index.between?(0,8) && ((board[index] == " ") || (board[index] == ""))
       true
     elsif (board[index] == " ") || (board[index] == "") || (board[index] == nil)
       false
   end
 end

 def turn(board)
       puts "Please enter 1-9:"
       user_input = gets.strip
       index = input_to_index(user_input)
       while valid_move?(board, index) == false do
         puts "Please enter 1-9:"
         user_input = gets.strip
         index = input_to_index(user_input)
         valid_move?(board, index)
     end
     move(board, index, current_player(board))
     display_board(board)
   end

  def turn_count(board)
    counter = 0
    board.count {|token| token == "X" || token == "O"}
  end

  def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end

  def won?(board)
   if board.include?("X"||"O")
     WIN_COMBINATIONS.each do |win_comb|
        if [board[win_comb[0]], board[win_comb[1]], board[win_comb[2]]].all? {|i| i == board[win_comb[0]]} && position_taken?(board, win_comb[0] )
         return win_comb
       end
     end
     false
   end
  end

  def full?(board)
    !(board.any? {|i| [" ",""].include? i})
  end

  def draw? (board)
    full?(board) && !won?(board)
  end

  def over?(board)
    if draw?(board) || won?(board) || full?(board)
      true
    end
  end

  def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    end
  end

def play(board)
  until over?(board) do
    turn(board)
  end
  if draw?(board)
      puts "Cat's Game!"
  else won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end
