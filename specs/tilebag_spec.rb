require_relative 'spec_helper'
require_relative '../tilebag'

describe Scrabble::TileBag do
	describe "#initialize" do

		it "must create an instance of TileBag" do
			new_game = Scrabble::TileBag.new
			new_game.must_be_instance_of(Scrabble::TileBag)
		end

		it "must be initialized with the proper distribution of letters" do
			new_game = Scrabble::TileBag.new
			tiles = {
				"A" => 9, "B" => 2,
				"C" => 2, "D" => 4,
				"E" => 12, "F" => 2,
				"G" => 3, "H" => 2,
				"I" => 9, "J" => 1,
				"K" => 1, "L" => 4,
				"M" => 2, "N" => 6,
				"O" => 8, "P" => 2,
				"Q" => 1, "R" => 6,
				"S" => 4, "T" => 6,
				"U" => 4, "V" => 2,
				"W" => 2, "X" => 1,
				"Y" => 2, "Z" => 1
			}

			tiles.each do |key, value|
				new_game.tiles[key].must_equal(value)
			end
		end

		# it "must be initialized with all available letters" do
		# 	new_game = Scrabble::TileBag.new
		# 	available_tiles = ["A", "B", "C", "D", "E",
		# 		"F", "G", "H", "I", "J", "K", "L", "M",
		# 		"N", "O", "P", "Q", "R", "S", "T", "U",
		# 		"V", "W", "X", "Y", "Z"]
		#
		# 	new_game.available_tiles.must_equal(available_tiles)
		# end
	end

	describe "#draw_tiles(num)" do
		it "should raise an error when a non-Fixnum is passed in" do
			new_game = Scrabble::TileBag.new
			bad_args = ["a", 1.2, "2a", "2", "!"]

			bad_args.each do |item|
				proc { new_game.draw_tiles(item) }.must_raise(ArgumentError)
			end
		end

		it "should return an array containing num tiles" do
			new_game = Scrabble::TileBag.new
			new_game.draw_tiles(3).length.must_equal(3)
		end

		it "should not pick a tile[key] that has tile[value] = 0" do
			new_game = Scrabble::TileBag.new
			new_game.draw_tiles(98) #98 is total num of tiles
			all_tiles = new_game.tiles.values.reduce(:+)
			all_tiles.must_equal(0)
		end

		it "should decrease the num of available tiles inside tiles hash" do
			new_game = Scrabble::TileBag.new
			original_values = new_game.tiles.values.clone
			new_game.draw_tiles(1)
			new_game.tiles.values.wont_equal(original_values)
		end
	end

end
