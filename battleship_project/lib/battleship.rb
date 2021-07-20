require_relative "./board.rb"
require_relative "./player.rb"

class Battleship

        attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        print "{#place_random_ships}"
        @board.print
    end

end
