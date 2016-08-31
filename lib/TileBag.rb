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

  end

  def draw_tiles(num)
# returns num of random tiles, removes those tiles from default set.


  end

  def tiles_remaining
# returns the numbers of tiles remaining in the bag.

  end

end

# see player class for wave 3 modifications
