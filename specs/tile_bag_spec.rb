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
        current_letters = tile_bag.game_tile_bag.clone # cloned hash
        test_tile_array = tile_bag.draw_tiles(2) #array of letters
        test_tile_array.each do |tile_letter|
          number_of_letters_available = tile_bag.game_tile_bag[tile_letter][1]
          current_letters[tile_letter][1].wont_equal(number_of_letters_available)
          # @todo OUR BEAUTIFUL CODE DOES NOT WORK, MAYBE TRY USE .COLLECT or .EACH after all
        end


      end
      #
      # it "should not allow player to draw more tiles than tray_max" do
      #
      # end
      # WE CARE that the tiles run out

    end


  end
end
