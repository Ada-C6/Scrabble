require_relative 'spec_helper'
require_relative '../player'
require_relative '../tilebag'

describe Scrabble::TileBag do

  # We tried to learn how to do a before block and refactor but had more difficulty with this than expected. 

  describe "#initialize" do
    it "should initialize a new instance of TileBag" do
      tiles = Scrabble::TileBag.new
      tiles.must_be_instance_of(Scrabble::TileBag)
    end
  end

  describe "#fill_bag" do
    it "should take the number of letter tiles in TILES hash and put each into an array" do
      # TO DO: Refactor
      tiles = Scrabble::TileBag.new
      tiles.fill_bag.length.must_equal(98)
    end

    it "should not match the snapshot of the @letters_available array" do
      tiles = Scrabble::TileBag.new
      tiles.fill_bag.wont_equal(tiles.snapshot)
    end

  end

  describe "#draw_tiles(num)" do
    it "should return the same number of tiles as the player's last word played" do
      tiles = Scrabble::TileBag.new
      word = "BEAR"
      tiles.draw_tiles(4).must_equal(word.length)
    end

    it "should remove the newly drawn tiles from the default set" do
      tiles = Scrabble::TileBag.new
      tiles.fill_bag
      tiles.draw_tiles(4)
      tiles.letters_available.length.must_equal(98 - 4)
    end
  end

  describe "#tiles_remaining" do
    it "should return the number of tiles remaining in the bag" do
      tiles = Scrabble::TileBag.new
      tiles.fill_bag
      tiles.draw_tiles(4)
      tiles.tiles_remaining.must_equal(98 - 4)
    end
  end

  describe "#available_letter_array" do
    it "should return the available letters array" do
      tiles = Scrabble::TileBag.new
      tiles.fill_bag
      tiles.available_letter_array.length.must_equal(tiles.tiles_remaining)
    end
  end
end
