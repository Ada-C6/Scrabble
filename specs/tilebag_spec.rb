require_relative 'spec_helper'
require_relative '../tilebag'

describe Scrabble::TileBag do
p = Scrabble::TileBag.new

	describe "initialize" do
 		it "should be an instance of TileBag" do
	 	p.must_be_instance_of(Scrabble::TileBag)
	  end
  end
end


# 	• #initialize Called when you use TileBag.new, sets up an instance with a collection of default tiles
# 	• #draw_tiles(num) returns num number of random tiles, removes the tiles from the default set.
# 	• #tiles_remaining returns the number of tiles remaining in the bag
