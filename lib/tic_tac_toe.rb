
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


def won?(board)

WIN_COMBINATIONS.each_index do |i|
  combOne = WIN_COMBINATIONS[i]

  if (board[combOne[0]] == 'X' &&
     board[combOne[1]] == 'X'  &&
     board[combOne[2]] == 'X') ||
     (board[combOne[0]] == 'O' &&
     board[combOne[1]] == 'O'  &&
     board[combOne[2]] == 'O')
     return combOne
  end
end
  return false
end

def full?(board)
   board.each do |item|
     if item == " "
       return false
     end
   end

   return true
end


def draw?(board)
   full?(board) && !won?(board)
end


def over?(board)
  won?(board) || full?(board) || draw?(board)
end


#condtion ? conditon is true : condtion is false

def winner(board)
  w = won?(board)
  w != false ? board[w[0]] : nil
end

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

def move(board,position,value)
   board[position] = value
end


def valid_move?(board,position)
  if position > -1
    return board[position] == " "
  else
    return false
  end
end

def turn_count(board)
  count = 0
  board.each do | item|
    if item != ' '
      count +=1
    end
  end
  count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? 'X' : 'O'
end


def turn(board)
  @currVar = "X"
  index = 0
  loop  do
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    break if index > -1
  end
  valid_move?(board, index)
  move(board, index, index.even? ? 'X' : 'O')


  display_board(board)
end



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
