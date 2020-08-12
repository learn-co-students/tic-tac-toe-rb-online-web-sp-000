WIN_COMBINATIONS = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[2, 4, 6]
]

def display_board(board)
	puts
	puts " #{board[0]} | #{board[1]} | #{board[2]} "
	puts "-----------"
	puts " #{board[3]} | #{board[4]} | #{board[5]} "
	puts "-----------"
	puts " #{board[6]} | #{board[7]} | #{board[8]} "
	puts
end

def input_to_index(input)
	input.to_i - 1
end

def move(board, index, token)
	board[index] = token
end

def position_taken?(board, index)
	!(board[index] == " ")
end

def valid_move?(board, index)
	index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
	board.count {|position| position == "X" || position == "O"}
end

def current_player(board)
	turn_count(board).odd? ? "O" : "X"
end

def turn(board)
	puts "Please enter 1-9:"

	input = gets.strip
	index = input_to_index(input)
	token = current_player(board)

	if valid_move?(board, index)
		move(board, index, token)
		display_board(board)
	else
		turn(board)
	end
end

def won?(board)
	WIN_COMBINATIONS.find do |combi|
		position_taken?(board, combi[0]) &&
		board[combi[0]] == board[combi[1]] &&
		board[combi[0]] == board[combi[2]]
	end
end

def full?(board)
	board.none? {|position| position == " "}
end

def draw?(board)
	!won?(board) && full?(board)
end

def over?(board)
	won?(board) || draw?(board)
end

def winner(board)
	won?(board) && board[won?(board)[0]]
end

def play(board)
	until over?(board)
		turn(board)
	end

	if won?(board)
		puts "Congratulations #{winner(board)}!"
	else
		puts "Cat's Game!"
	end
end
