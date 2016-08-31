require_relative '../lib/Scoring'
require_relative '../lib/Player'
require_relative '../module'

class Tilebag

# attr_accessor

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
# may want to flatten - make one long array 
  end

  def draw_tiles(num)
# returns num of random tiles, removes those tiles from default set.
  # we need to figure out another way to randomly grab 7 tiles. from the bag. Likely a better solution than .pop.
    default_tile_bag.shuffle  #???
    picked_tiles = default_tile_bag.pop(7)
    return picked_tiles

    # check total tiles -> 7 tiles (check edge cases for that)
    # what happens if draw and no more tiles left in bag - Throw error if draw more than that
  end

  def tiles_remaining
# returns the numbers of tiles remaining in the bag.
# num_tiles_remain
    # return num_tiles_remain

  end

end

# see player class for wave 3 modifications
