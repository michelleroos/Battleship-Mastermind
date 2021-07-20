class Player

    def get_move
        puts 'enter a position with coordinates separated with a space like `4 7`'
        position = gets.chomp # "4 7"
        position.split(" ").map! { |s| s.to_i }  # ["4", "7"]
        
    end
end
