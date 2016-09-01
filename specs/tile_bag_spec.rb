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



end # TileBag class
