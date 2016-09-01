require_relative '../lib/Scoring'
require_relative '../lib/Player'
require_relative '../module'

class Scrabble::TileBag

attr_reader :picked_tiles

  def initialize
# called When you use TileBag.new sets up an instance with a collection of default tiles.
@default_tile_bag = [
  ["A", "A", "A", "A", "A", "A", "A", "A", "A"],
  ["B", "B"],["C", "C"], ["D", "D", "D", "D"],
  ["E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E"],
  ["F", "F"], ["G", "G", "G"], ["H", "H"],
  ["I", "I", "I", "I", "I", "I", "I", "I", "I"],
  ["J"], ["K"], ["L", "L", "L", "L"], ["M", "M"],
  ["N", "N", "N", "N", "N", "N"],
  ["O", "O", "O", "O", "O", "O", "O", "O"],
  ["P", "P"], ["Q"], ["R", "R", "R", "R", "R", "R"],
  ["S", "S", "S", "S"], ["T", "T", "T", "T", "T", "T"],
  ["U", "U", "U", "U"], ["V", "V", "V", "V"], ["W", "W"],
  ["X"], ["Y", "Y"], ["Z"]
  ]
  # may want to flatten - make one long array flatten! -> assign to another variable, flattened_default_tile_bag = @default_tile_bag.flatten!
  @flattened_default_tile_bag = @default_tile_bag.flatten
  @picked_tiles = []

  end

  def draw_tiles(num)
  # Purpose: returns a number (num) of random tiles, removes those tiles from default set.
  # shuffle @flattened_default_tile_bag
  # push a letter from flattened+default_tile_bag.pop(num) into picked_tiles
  # use .flatten! and .shuffle!
  # if statement for number of tiles left in bag!  Throw error if try to draw more tiles than are left in bag: "There are only #{num_tiles_remain} left in the bag!"
    @flattened_default_tile_bag.shuffle!

    if @flattened_default_tile_bag.length < num
      return "You can't draw that number of tiles. There are not enough tiles left in the bag."
    end
    picked_tiles << @flattened_default_tile_bag.pop(num)
    return picked_tiles.flatten!
  end

  def tiles_remaining
    # returns the numbers of tiles remaining in the bag.
  num_tiles_remain = @flattened_default_tile_bag.length
  return num_tiles_remain

  end

end

tilebag1 = Scrabble::TileBag.new

print tilebag1.draw_tiles(5)



# see player class for wave 3 modifications
