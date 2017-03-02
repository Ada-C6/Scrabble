require_relative 'spec_helper'
require_relative '../tile_bag'

describe Scrabble::TileBag do
    let(:tile_test) {Scrabble::TileBag.new}
    describe "#initialize" do
        it "can create a new instance of TileBag" do
            tile_test.must_be_instance_of(Scrabble::TileBag)
        end

        it "has a set of letter tiles" do
            tile_test.must_respond_to(:tiles)
        end

        it "has a number of tiles remaining" do
            tile_test.tiles_remaining.must_be_instance_of(Fixnum)
        end
    end

    describe "#draw_tiles" do
        it "returns an array of random tiles" do
            tile_test.draw_tiles(3).length.must_equal(3)
            tile_test.draw_tiles(3).must_be_instance_of(Array)
        end

        it "must change the tile collection" do
            another_tile_bag = Scrabble::TileBag.new
            another_tile_bag.draw_tiles(6)
            tile_test.tiles.length.wont_equal(another_tile_bag.tiles.length)
        end

        it "will track the number of tiles remaining" do
            another_tile_bag = Scrabble::TileBag.new
            another_tile_bag.tiles_remaining.must_equal(98)
            another_tile_bag.draw_tiles(4)

            another_tile_bag.tiles_remaining.must_equal(94)
        end
    end
end
