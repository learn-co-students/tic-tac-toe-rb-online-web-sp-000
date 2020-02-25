
#win_combinations
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
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
  user_input.to_i - 1 
end 

#move
def move(board, index, current_player)
  board[index] = current_player
end

#position_taken?
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
end

#valid_move
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index) 
end

#turn_count
def turn_count(value)
  count = 0 
  value.each do |turn|
    if turn == "X" || turn == "O"
      count += 1 
    end
  end
  return count 
end

#current_player
def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"
end

#full?
def full?(board)
   board.all? {|i| i == "X" || i == "O"}
end

#draw?
def draw?(board)
   if !won?(board) && full?(board)
     return true
   elsif !won?(board) && !full?(board)
     return false
   else won?(board)
     return false
   end
end

#over?
def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
   end
end

#won
def won?(board)
 WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]
   position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
 end
end

#position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)

#winner
def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   end
end

#turn 
def turn(board)
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   if valid_move?(board, index)
      move(board, index, current_player(board))
      turn(board)
   end
   display_board(board)
end

#play 
def play(board)
   until over?(board) 
      turn(board)
   end 
   if won?(board)
      winner(board) == "X" || winner(board) == "O" 
      puts "Congratulations #{winner(board)}!" 
   elsif draw?(board)
      puts "Cats Game!" 
   end 
end