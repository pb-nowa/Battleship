class Board
    attr_reader :grid, :size 
 
    def self.print_grid(arr)
        arr.each { |row| puts row.join(" ") }
    end

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n ** 2
    end

    def length
        grid.length
    end

    def [](arr)
        x, y = arr
        grid[x][y]
    end

    def []=(arr, el)
        x, y = arr
        grid[x][y] = el
    end

    def num_ships
        counter = 0
        grid.each do |row|
            row.each do |coordinate|
                counter += 1 if coordinate == :S
            end
        end
        counter 
    end

    def attack(target)
        if self[target] == :S
            self[target] = :H 
            puts 'you sunk my battleship!'
            return true 
        else 
            self[target] = :X
            return false
        end
    end

    def place_random_ships
        max_ships = size / 4

        until num_ships ==  max_ships
          x = rand(0...length)
          y = rand(0...length)
          coordinate = [x, y]
          self[coordinate] = :S
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(length) { Array.new(length, :N) }
        (0...length).each do |i|
            (0...length).each do |j|
                hidden_grid[i][j] = grid[i][j] unless grid[i][j] == :S
            end
        end
        hidden_grid 
    end

    def cheat 
        Board.print_grid(grid)
    end
    
    def print 
       Board.print_grid(hidden_ships_grid) 
    end

end
