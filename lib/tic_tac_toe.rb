require 'pry'

class TicTacToe

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    attr_accessor :board

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(string)
        string.to_i - 1
    end

    def move(index, token = 'X')
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        position_taken?(index) == false && (0..8).include?(index)
    end

    def turn_count
        n = 0
        @board.each do |symbol|
           if symbol != " "
            n += 1
            end
            
        end
        n
    end

    def current_player
       turn_count.odd? ? "O" : "X"
    end
    
    def turn
        player = current_player
        puts "Enter your move 1 - 9"
        choice = gets.chomp
        index = input_to_index(choice)
        if valid_move?(index) == true
            move(index, player)
            display_board
        else
            puts "Invalid move"
            turn
        end      
    end

    def won?
        board.any?(WIN_COMBINATIONS) do |combo|
            return combo
        end
    end
        


end