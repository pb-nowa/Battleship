require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player 

    def initialize(n)
        @board = Board.new(n)
        @player = Player.new
        @remaining_misses = (n ** 2) / 2
    end

    def start_game
        board.place_random_ships
        puts (@board.length ** 2) / 4
        board.print
    end

    def lose?
        if remaining_misses <= 0
            puts "you lose"
            return true
        end
        false
    end

    def win?
        if board.num_ships.zero?
            puts "you win"
            return true 
        end
        false 
    end

    def game_over?
        win? || lose? 
    end

    def turn 
        coordinate = player.get_move
        hit = board.attack(coordinate)
        board.print 
        @remaining_misses -= 1 unless hit
        puts remaining_misses
    end

    private 
    attr_reader :remaining_misses
end
