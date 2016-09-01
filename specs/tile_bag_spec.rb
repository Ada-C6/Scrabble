# test for TileBag class

require_relative '../tile_bag'
require_relative 'spec_helper'

describe Scrabble::TileBag do
    it "should have a TILES constant of type Hash" do
        Scrabble::TileBag::TILES.must_be_kind_of(Hash)
    end

    describe "#initialize" do
        it "must be an instance of the TileBag class" do
            Scrabble::TileBag.new.must_be_instance_of(Scrabble::TileBag)
        end

        it "the @collection instance variable should begin with 9 'A's" do
            test_tilebag = Scrabble::TileBag.new
            test_tilebag.collection.count("A").must_equal(9)
        end
    end # initialize

    describe "#draw_tiles(num)" do
        it "should raise an error if a non-Fixnum argument input is passed into the method" do
            proc {Scrabble::TileBag.new.draw_tiles('abc')}.must_raise(ArgumentError)
        end

        it "should return the number of random tiles corresponding to the number passed in the method's parameter" do
            Scrabble::TileBag.new.draw_tiles(6).length.must_equal(6)
        end

        it "should mutate the original @collection array after drawing random tiles" do
            big_bag = Scrabble::TileBag.new
            copy_collection = big_bag.collection.clone
            big_bag.draw_tiles(6)
            big_bag.collection.wont_equal(copy_collection)
        end
    end

    describe "#tiles_remaining" do
        it "should return the number of tiles remaining in the bag" do
            another_bag = Scrabble::TileBag.new
            len = another_bag.collection.length
            another_bag.draw_tiles(4)
            another_bag.tiles_remaining.must_equal(len-4)
        end

    end

end # TileBag class
