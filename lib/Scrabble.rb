# STUCK? Did you remember to .self the method?
#STUCK STILL?? Check the class!!!
# I'm a sample comment!

require_relative '../Scrabble.rb'
require_relative 'Player.rb'
require_relative 'Scoring.rb'

class Scrabble::TileBag

  attr_reader :tile_bag

  def initialize

    @tile_bag = {"A"=>9, "B"=>2, "C"=>2, "D"=>4, "E"=>12, "F"=>2, "G"=>3, "H"=>2, "I"=>9, "J"=>1, "K"=>1, "L"=>4, "M"=>2, "N"=>6, "O"=>8, "P"=>2, "Q"=>1, "R"=>6, "S"=>4, "T"=>6, "U"=>4, "V"=>2, "W"=>2, "X"=>1,"Y"=>2, "Z"=>1}

     return @tile_bag
  end

  def draw_tiles(num)
    unless num <= 7
      raise ArgumentError.new("You cannot draw more than 7 tiles")
    end

    draw_tiles = []
    while num > 0
      tile = @tile_bag.keys.sample(1)[0]

      if @tile_bag[tile] != 0
         @tile_bag[tile] -= 1
        draw_tiles << tile
        num -= 1
      end
    end
    return draw_tiles
  end

  def tiles_remaining
    tiles_remaining = @tile_bag.values
    sum = tiles_remaining.inject {|sum, element| sum + element}
    return sum
  end

end

#test1 = Scrabble::TileBag.new
# testplayer = Scrabble::Player.new("Elle")

t = Scrabble::TileBag.new
person = Scrabble::Player.new("Bill")
puts person.draw_tiles(t)

# print testplayer.player_bag.inspect
# print testplayer.player_hand
# puts testplayer.inspect
# print testplayer.inspect
#print testplayer.player_bag


#print testplayer.draw_tiles(@player_hand)
# # puts test1.draw_tiles(12)
# print test1.tiles_remaining

# test1.play("potato")
# test1.play("apple")
# test1.play("majesty")
# test1.play("xylophone")
# puts test1.total_score
# puts test1.won?
