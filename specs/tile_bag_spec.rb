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

end
