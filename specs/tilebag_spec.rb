require_relative 'spec_helper'
require_relative '../tilebag'

describe Scrabble::TileBag do

  describe "#initialize" do

    it "can create a new instance of Tilebag" do
      Scrabble::TileBag.new.must_be_instance_of(Scrabble::TileBag)
    end

    it "has a default_tiles property" do
      Scrabble::TileBag.new.must_respond_to(:default_tiles)
    end
  end

  describe "#draw_tiles" do

    it "should return an array" do
      s = Scrabble::TileBag.new
      s.draw_tiles(5).must_be_instance_of(Array)
    end

    it "should return array with a length equal to num" do
      s = Scrabble::TileBag.new
      tiles_drawn = s.draw_tiles(4)
      tiles_drawn.length.must_equal(4)
    end
  end

  describe "#tiles_remaining" do

    it "returns the number of remaining default tiles" do
      s = Scrabble::TileBag.new
      s.draw_tiles(5)
      s.default_tiles.wont_equal(:default_tiles)
    end
  end
end
