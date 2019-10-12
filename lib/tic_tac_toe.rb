require 'pry'
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [ 
  [0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[2,4,6],
]

def input_to_index(input)
  index = input.to_i - 1
  index
end                           
                                
def move(board, index, char)
    board[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  #return true if index is in range of 0-8 
  if index.between?(0,8) && board[index] == " "
     return true
  end
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    input = input_to_index(input)
    
      if valid_move?(board, input) == true
       
          move(board, input, token = "X")
          else 
            turn(board)
       end
     display_board(board)
  end

def turn_count(board)
  count = 0
   board.each do |plays|
     
     if "#{plays}" == "X" || "#{plays}" == "O"
       count += 1 
     end 
  end
      count
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def full?(board)
        if board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
          return true
      else return false
    end
end


def won?(board)
      #binding.pry 
  if board == [" "," "," "," "," "," "," "," "," "]
    return false
  end
      
    WIN_COMBINATIONS.detect do |win_combo|
         board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]] && board[win_combo[0]] != " " 
    end
end

def draw?(board)
     if full?(board) && !won?(board)
       true
         else
           false
     end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
        true
    else 
        false
  end
end

def winner(board)
 # binding.pry
    if won?(board)
      board[won?(board).first] 
    end
end


def play(board)
  #binding.pry
    turn(board)
      
      over?(board)
      over?(board)
      over?(board)
    
end








