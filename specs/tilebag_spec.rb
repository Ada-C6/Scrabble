require_relative 'spec_helper'
require_relative '../tilebag'

describe Scrabble::TileBag do
  describe "#initialize" do
    tbag = Scrabble::TileBag.new
    it "should set up an instance with a collection of default tiles" do
      tbag.must_be_instance_of(Scrabble::TileBag)
    end

    it "should return an array of default tiles" do
      tbag.bag_of_tiles.must_be_kind_of(Array)
    end

    it "should have the correct number of tiles of each letter" do
      tbag.bag_of_tiles.count("R").must_equal(6)
    end

  end
  #draw_tiles(num) returns num number of random tiles, removes the tiles from the default set.

end


# Create a Scrabble::TileBag class with a minimum of 5 specs. It should have the following class and instance methods:

#initialize Called when you use TileBag.new, sets up an instance with a collection of default tiles
#tiles_remaining returns the number of tiles remaining in the bag
