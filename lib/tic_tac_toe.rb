 require "pry"
    #binding.pry 
    
    
    WIN_COMBINATIONS = [ 
      [0, 1, 2],  
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2],     
      ]
      
      
    def position_taken?(board)
        if !board == nil? || !board == " "
        true 
        end 
    end 
    
    
      def won?(board)
       WIN_COMBINATIONS.detect do |array|
       index_1 = array[0]
       index_2 = array[1]
       index_3 = array[2]
     
     position_1 = board[index_1]
     position_2 = board[index_2]
     position_3 = board[index_3]
     
        
      if position_1 == position_2 && position_2 == position_3 && (position_1 == "X" || position_1 == "O")
      return array
      end 
     end 
     return false 
  end  

     
    def full?(board) 
      board.all?{|token| token == "X" || token == "O" || board.all? == " "}
    end 
    
    
    def draw?(board)
      if full?(board) && !won?(board)
      return true  
      elsif !full?(board) && !won?(board)
      return false 
    end
    end 
    
    
    def over?(board)
      won?(board) || full?(board)
    end 
    
    
    def winner(board)
         winning_value = won?(board)
         if winning_value 
           board[winning_value[0]]
         end 
    end 
    
     
    