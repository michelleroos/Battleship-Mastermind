class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](pos_arr) # [2, 2]
        row = pos_arr[0]
        col = pos_arr[-1]
        @grid[row][col]
    end

    def []=(pos_arr, value) # [2, 2]
        row = pos_arr[0]
        col = pos_arr[-1]
        @grid[row][col] = value
    end

    def num_ships
        count = 0
        @grid.flatten.each { |pos| count += 1 if pos == :S}
        count
    end

    def attack(pos_arr)
        if self[pos_arr] == :S
            self[pos_arr] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos_arr] = :X
            return false
        end
    end

    def place_random_ships # 10 * 10 = 100
        random_ships = @size * 0.25 # 100 * .25 = 25
        until self.num_ships == random_ships
            row = rand(0...@grid.length) # 3
            col = rand(0...@grid.length) # 4
            pos_arr = [row, col] # [3, 4]
            self[pos_arr] = :S
        end
    end

    def hidden_ships_grid
        hidden_grid = []
        @grid.each do |subArray|
            hidden_grid << subArray.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(arr)
        arr.each { |ele| puts ele.join(" ") }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end

# [
# [:S, :N],
# [:X, :S]]
# ]

# S N
# X S

# game_1 = Board.new(3)
#<Board:0x00007fe7379ce1d8 @grid=[[:S, :N], [:X, :S]], @size=4>

# @ GRID
# [
# [:N, :N, :N],
# [:N, :N, :N],
# [:N, :N, :N]
# ]

# [
# [:N, :N, :N],
# [:N, :S, :N],
# [:N, :N, :S]
# ]

# [
# [00, 01, 02],
# [10, 11, 12],
# [20, 21, 22]
# ]