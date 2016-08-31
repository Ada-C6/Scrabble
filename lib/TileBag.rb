require_relative '../lib/Scoring'
require_relative '../lib/Player'
require_relative '../module'

class Tilebag

  def initialize
# lettters_array = []
# called When you use TileBag.new sets up an instance with a collection of default tiles.
default_tile_bag = {
"A" =>
"B" =>
"C" => 3,
"D" =>
"E" => 1
"F" =>
"G" =>
"H" =>
"I" =>
"J" => 8
"K"=> 5
"L"=> 1
"M"=> 3
"N"=> 1
"O"=> 1
"P"=> 3
"Q"=> 10
"R"=> 1
"S"=> 1
"T"=> 1
"U"=> 1
"V"=> 4
"W"=> 4
"X"=> 8
"Y"=> 4
"Z"=> 10
}
  end

  def draw_tiles(num)
# returns num of random tiles, removes those tiles from default set.


  end

  def tiles_remaining
# returns the numbers of tiles remaining in the bag.

  end

end

# see player class for wave 3 modifications
