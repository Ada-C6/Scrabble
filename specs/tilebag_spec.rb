require_relative 'spec_helper'
require_relative '../tilebag'

describe Scrabble::TileBag do
	p = Scrabble::TileBag.new

	describe "initialize" do
		it "should be an instance of TileBag" do
			p.must_be_instance_of(Scrabble::TileBag)
		end
	end

	describe "draw_tiles" do
		it "should return designated number of random tiles" do
			p.draw_tiles(2).class.must_equal(Array)
		end
		it "should removes the tiles from the default set " do
			remaining = p.tiles_remaining
			p.draw_tiles(4)
			p.tiles_remaining.must_equal(remaining-4)
		end
	end

	describe "tiles_remaining" do
		it "should have 98 tiles when a new instance is called" do
			q = Scrabble::TileBag.new
			q.tiles_remaining.must_equal(98)
		end
		it "should return the number of tiles remaining in the bag" do
			r = Scrabble::TileBag.new
			r.draw_tiles(3)
			r.draw_tiles(5)
			r.tiles_remaining.must_equal(90)
		end
	end
end
