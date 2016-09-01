require_relative 'spec_helper'
require_relative '../tilebag.rb'

describe Scrabble::Tilebag do
  describe "#initialize" do
    it "should create a new instance of Tilebag" do
      Scrabble::Tilebag.new.must_be_instance_of(Scrabble::Tilebag)
    end

    it "should initialize with 98 number of tiles" do
      Scrabble::Tilebag.new.all_tiles.values.reduce(:+).must_equal(98)
    end

    it "should initialize with 26 letters" do
      Scrabble::Tilebag.new.all_tiles.length.must_equal(26)
    end
  end

  describe "#draw_tiles" do
    it "should return an array" do
      Scrabble::Tilebag.new.draw_tiles(1).must_be_kind_of Array
    end

    it "should return an array that has a length equal to number of tiles drawn" do
      Scrabble::Tilebag.new.draw_tiles(1).length.must_equal(1)
    end
  end

  describe "#tiles_remaining" do
    it "should return a number" do
      Scrabble::Tilebag.new.tiles_remaining.must_be_kind_of Fixnum
    end

    it "should return a number that is equal to the sum of the values in all_tiles hash" do
      m = Scrabble::Tilebag.new
      original_sum = m.all_tiles.values.reduce(:+)
      m.draw_tiles(3)
      m.draw_tiles(5)
      m.tiles_remaining.must_equal(original_sum - 8)
    end
  end

end
