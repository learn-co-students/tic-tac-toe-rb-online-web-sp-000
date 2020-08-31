WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, player_index, character)
  board[player_index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else board[index] == "X" || board[index] ==  "O"
    true
  end
end

board = []
index = 0
move = index - 0

def valid_move?(board, move)

  if position_taken?(board, move) == true
    false
  else position_taken?(board, move) == false
    if move.between?(0,8)
      true
    else
      false
    end
  end
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
    counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  board_index = input_to_index(gets.strip)
  if valid_move?(board, board_index) == true
    board[board_index] = current_player(board)
  else
    until valid_move?(board, board_index) == true
      puts "Please enter 1-9:"
      board_index = input_to_index(gets.strip)
    end
  end
  display_board(board)
end

def won?(board)
  array = WIN_COMBINATIONS.select do |combo|
              win_index_1 = combo[0]
              win_index_2 = combo[1]
              win_index_3 = combo[2]

              position_1 = board[win_index_1]
              position_2 = board[win_index_2]
              position_3 = board[win_index_3]

              if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
                return [win_index_1, win_index_2, win_index_3]
              end
          end
  if array == []
    false
  end
end

def full?(board)
  board.none? {|i| (i == nil?) || (i == " ")}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) #!= false
    true
  elsif draw?(board) == true || full?(board) == true
    true
  else draw?(board) == false
    false
  end
end

def winner(board)
  if won?(board)
    winning_array = won?(board)
    winning_array.all? do |i|
      return board[i]
    end
  else won?(board) == false
    return nil
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
