#Define WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

#Define #display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Define #input_to_index
def input_to_index(input)
  "#{input}".to_i - 1
end

#Define #move
def move(board, index, value)
  board[index] = value
end

#Define #position_taken?
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#Define #valid_move?
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#Define #turn_count
def turn_count(board)

  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns

end

#Define #current_player
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

#Define #turn
def turn(board)
  if !full?(board)
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
end

#Define #turn_count
def turn_count(board)
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns
end

#Define #current_player
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

#Define #won?
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

#Define #full?
def full?(board)
  board.all? do  |token|
    token == "X" || token == "O"
  end
end

#Define #draw?
def draw?(board)
  full?(board) && !won?(board)
end

#Define #over
def over?(board)
  won?(board) || draw?(board)
end

#Define #winner
def winner(board)
winning_array = []

  if !won?(board)
    return nil
  elsif won?(board) != false
    winning_array = won?(board)
    return board[winning_array[0]]
  end
end

#Define #play
def play(board)
  turn(board) until over?(board)

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
