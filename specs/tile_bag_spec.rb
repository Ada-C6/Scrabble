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
        current_letters = (tile_bag.game_tile_bag).clone # cloned hash
        puts "current letters 1: #{current_letters}"
          # puts "current letters 1: #{tile_bag.game_tile_bag.object_id}"
        test_tile_array = tile_bag.draw_tiles(2) #array of letters
        puts test_tile_array
        puts "current letters 2: #{current_letters}"

        test_tile_array.each do |tile_letter|
          number_of_letters_available = tile_bag.game_tile_bag[tile_letter]
          puts "Game tile bag 3: #{tile_bag.game_tile_bag}"
          current_letters[tile_letter].wont_equal(number_of_letters_available)
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
#
# current_letters = d.game_tile_bag.clone # cloned hash
# test_tile_array = d.draw_tiles(2) #array of letters
# test_tile_array.each do |tile_letter|
#   number_of_letters_available = d.game_tile_bag[tile_letter][1]
#   # current_letters[tile_letter][1].wont_equal(number_of_letters_available)
#   puts current_letters[tile_letter][1] == number_of_letters_available
# end
#   #
