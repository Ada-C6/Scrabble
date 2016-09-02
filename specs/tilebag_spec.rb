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

    it "should not have the same amount of tiles returned as it started with" do
      s = Scrabble::TileBag.new
      s.draw_tiles(5)
      s.default_tiles.wont_equal(:default_tiles)
    end

    it "should return the number of tiles in default tiles after tiles have been drawn " do
      y = Scrabble::TileBag.new
      y.draw_tiles(5)
      y.tiles_remaining.must_equal(95)
    end
  end
end
