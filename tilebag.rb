# require_relative 'scoring'
module Scrabble
  class TileBag
   attr_accessor :letters_values
    def initialize
      @letters_values ={"A"=>9, "B"=>2, "C"=>2, "D"=>4, "E"=>12,"F"=>2,"G"=>3, "H"=>2,
        "I"=>9, "J"=>1, "K"=>1, "L"=>4, "M"=>2, "N"=>6, "O"=>8, "P"=>2, "Q"=>1,
        "R"=>6, "S"=>4, "T"=>6, "U"=>4, "V"=>2, "W"=>2, "X"=>1, "Y"=>2, "Z"=>1}

    end

# my_hash2 ={"name"=>"bibi", "age" => 28}

  end
end


#initialize Called when you use TileBag.new, sets up an instance with a collection of default tiles
# 	• #draw_tiles(num) returns num number of random tiles, removes the tiles from the default set.
# 	• #tiles_remaining returns the number of tiles remaining in the bag
