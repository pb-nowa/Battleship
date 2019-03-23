class Player

    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        puts "enter a position"
        input = gets.chomp
        coordinate = input.split(" ")
        coordinate.map { |n| n.to_i }
    end

end
