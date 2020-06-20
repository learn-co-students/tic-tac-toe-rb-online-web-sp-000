board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
board1 = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

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

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
      win_index1 = win_combination[0]
      win_index2 = win_combination[1]
      win_index3 = win_combination[2]
      position1 = board[win_index1]
      position2 = board[win_index2]
      position3 = board[win_index3]
      if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
        return [win_index1, win_index2, win_index3]
      end
    end
end
print won?(board1)[2]*2
