# require_relative 'scoring'
module Scrabble
  class TileBag
   attr_accessor :letters
    def initialize
      # @letters_values ={"A"=>9, "B"=>2, "C"=>2, "D"=>4, "E"=>12,"F"=>2,"G"=>3, "H"=>2, "I"=>9, "J"=>1, "K"=>1, "L"=>4, "M"=>2, "N"=>6, "O"=>8, "P"=>2, "Q"=>1,"R"=>6, "S"=>4, "T"=>6, "U"=>4, "V"=>2, "W"=>2, "X"=>1, "Y"=>2, "Z"=>1}
      @letters = []
      9.times do
        letters << "A"
        letters << "I"
      end

      8.times do
        letters << "O"
      end

      6.times do
        letters << "N"
        letters << "R"
        letters << "T"
      end

      4.times do
        letters << "D"
        letters << "S"
        letters << "U"
        letters << "L"
      end

      3.times do
        letters << "G"
      end

      2.times do
        letters << "B"
        letters << "C"
        letters << "F"
        letters << "H"
        letters << "M"
        letters << "P"
        letters << "V"
        letters << "W"
        letters << "Y"
      end

      1.times do
        letters << "J"
        letters << "K"
        letters << "Q"
        letters << "X"
        letters << "Z"
      end

      12.times do
        letters << "E"
      end
    end

    def draw_tiles(num)
      random_tiles = []
      num.times do
        pick = rand(1..@letters.length) - 1
        random_tiles << @letters[pick]
        @letters.delete_at(pick)
      end
      return random_tiles
    end

    def tiles_remaining
     num_tiles_remaining = @letters.length
     return num_tiles_remaining
    end
  end
end


# p= Scrabble::TileBag.new

# puts p.draw_tiles(4)
# puts p.tiles_remaining
# puts p.draw_tiles(8)
# puts p.tiles_remaining

#initialize Called when you use TileBag.new, sets up an instance with a collection of default tiles
# 	• #draw_tiles(num) returns num number of random tiles, removes the tiles from the default set.
# 	• #tiles_remaining returns the number of tiles remaining in the bag
