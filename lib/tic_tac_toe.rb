def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



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




def input_to_index(input)
  input = input.to_i

  if input.is_a? Integer
    return input - 1
  else
    return -1
  end

end



def position_taken?(board, index)

  if board[index] == "" || board[index] == " " || board[index] == nil
    return false
  else
    return true
  end

end



def valid_move?(board,index)

  if !position_taken?(board, index) && index < 9 && index >= 0
    return true
  else
    return false
  end

end



def move(board, index, character)
  board[index] = character
end



def turn_count(board)
  count = 0
  i = 0

  until i == 9 do
    if position_taken?(board, i)
      count += 1
    end
    i += 1
  end

  return count

end

def current_player(board)

  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end

end

def won?(board)

  if winIterator(board, "X") == "X" || winIterator(board, "O") == "O"
    return true
  else
    return false
  end

end

def winIterator(board, character)
  WIN_COMBINATIONS.each do |array|

     charWin = array.all? do |element|
       board[element] == character
     end

     if charWin
       return character
     end

  end

  return nil

end



def winner(board)
  #x wins
  if winIterator(board, "X") == "X"
    return "X"
  end

  #y wins
  if winIterator(board, "O") == "O"
    return "O"
  end

  #no winner
  return nil

end



def full?(board)
  if turn_count(board) == 9
    return true
  else
    return false
  end
end



def draw?(board)

  if full?(board) && !won?(board)
    return true #draw - neither x nor y won
  else
    return false #not draw - game not over
  end

end



def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end

end



def play(board)

  loop do

    if over?(board)

      if winIterator(board, "X") == "X"
        puts "Congratulations X!"
        break
      elsif winIterator(board, "O") == "O"
        puts "Congratulations O!"
        break
      else
        puts "Cat's Game!"
        break
      end

    else
      turn(board)
    end
  end
end





def turn(board)
  character = ""

  index = input_to_index(gets.strip)

  if valid_move?(board, index)

    if turn_count(board) % 2 == 0
      character = "X"
    else
      character = "O"
    end

    move(board, index, character)
    return board

  else
    puts "Input was invalid. Please try again."
    turn(board)
  end

end
