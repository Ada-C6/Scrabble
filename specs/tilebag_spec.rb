require_relative'Spec_helper'
require_relative '../lib/Scoring'
require_relative '../lib/Player'

describe Scrabble::Player do
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
    bag1 = Scrabble::TileBag.new
# how do we garuntee that these are random?
    tilebag1.draw_tiles(4)
    tilebag1.draw_tiles(2)
    tilebag1.draw_tiles(1)
    expect(bag1.tiles_remaining).must_equal(93)
  end
#4
  it "After drawing 100 tiles, remaining tiles should = 0" do
    bag1 = Scrabble::TileBag.new
    tilebag1.draw_tiles(100)

    expect(bag1.tiles_remaining).must_equal(0)
  end
#5


end

#
#
#
