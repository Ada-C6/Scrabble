require_relative "../lib/tile_bag.rb"
require_relative 'spec_helper'
module Scrabble
  describe TileBag do

    #describe "#initialize" do
      let(:tile_bag) { TileBag.new }

      it "can create an instance of TileBag" do
        tile_bag.must_be_instance_of(TileBag)
      end

    #end

    describe "#draw_tiles(num)" do
      let(:tile_bag) { TileBag.new }

      it "should return an array" do
          tile_bag.draw_tiles(1).must_be_kind_of(Array)
      end

      it "should return an array of length equal to num" do
        tile_bag.draw_tiles(2).length.must_equal(2)
      end

      it "should remove tiles from the game_tile_bag" do
        current_letters = (tile_bag.game_tile_bag).clone
        test_tile_array = tile_bag.draw_tiles(2) #array of letters
        test_tile_array.each do |tile_letter|
          number_of_letters_available = tile_bag.game_tile_bag[tile_letter]
          current_letters[tile_letter].wont_equal(number_of_letters_available)
        end
      end

      it "should return an error if withdrawing more tiles than available in bag" do
        error_tile_bag = TileBag.new
        error_tile_bag.draw_tiles(87)
        proc {error_tile_bag.draw_tiles(1)}.must_raise(Exception)
      end
    end


  end
end
