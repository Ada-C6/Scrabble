# require_relative 'scoring'
module Scrabble
  class TileBag
   attr_accessor :letters
    def initialize
      # @letters_values ={"A"=>9, "B"=>2, "C"=>2, "D"=>4, "E"=>12,"F"=>2,"G"=>3, "H"=>2, "I"=>9, "J"=>1, "K"=>1, "L"=>4, "M"=>2, "N"=>6, "O"=>8, "P"=>2, "Q"=>1,"R"=>6, "S"=>4, "T"=>6, "U"=>4, "V"=>2, "W"=>2, "X"=>1, "Y"=>2, "Z"=>1}
      @letters = []
      9.times{|i| @letters << ["A", "I"]}
      8.times{|i| @letters << "O"}
      6.times{|i| @letters << ["N", "R", "T"]}
      4.times{|i| @letters << ["D", "S", "U", "L"]}
      3.times{|i| @letters << ["G"]}
      2.times{|i| @letters << ["B", "C", "F", "H", "M", "P", "V", "W", "Y"]}
      1.times{|i| @letters << ["J", "K", "Q", "X", "Z"]}
      12.times{|i| @letters << ["E"]}

      @letters.flatten!
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
