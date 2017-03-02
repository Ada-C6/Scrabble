require_relative'Spec_helper'
require_relative '../lib/Scoring'
require_relative '../lib/Player'
require_relative '../lib/TileBag'

describe Scrabble::TileBag do
#1
  it 'Does tile bag have 100 tiles?' do
    tilebag1 = Scrabble::TileBag.new
    expect(tilebag1.tiles_remaining).must_equal(100)
  end
#2
  it 'Does draw tiles method return correct num of tiles?' do
    tilebag1 = Scrabble::TileBag.new
    picked_tiles = tilebag1.draw_tiles(5)
    expect(picked_tiles.length).must_equal(5)
  end
#3
  it 'After drawing 7 tiles, remaining tiles should = 93' do
    tilebag1 = Scrabble::TileBag.new
# how do we garuntee that these are random?
    tilebag1.draw_tiles(4)
    tilebag1.draw_tiles(2)
    tilebag1.draw_tiles(1)
    expect(tilebag1.tiles_remaining).must_equal(93)
  end
#4
  it "There is an error if you try to hold more than 7 letters in your tile bag" do
    tilebag1 = Scrabble::TileBag.new
    tilebag1.draw_tiles(6)
    # we can't have more than our alotted 7 tiles
    proc {tilebag1.draw_tiles(2)}.must_raise(ArgumentError)
  end
#5
 it "Raise error if player tries to draw more than 7" do
   tilebag1 = Scrabble::TileBag.new
   # we can't have more than our alotted 7 tiles
   # proc, we didn't know you. till we did!
   proc {tilebag1.draw_tiles(8)}.must_raise(ArgumentError)
 end

end
