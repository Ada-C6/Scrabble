require_relative'Spec_helper'
require_relative '../lib/Scoring'
require_relative '../lib/Player'

describe Scrabble::Player do

  it 'Does tile bag have 100 tiles?' do
    tilebag1 = Scrabble::TileBag.new
    expect(tilebag1.tiles_remaining).must_equal(100)
  end


  it 'Does draw tiles method return correct num of tiles?' do
    tilebag1 = Scrabble::TileBag.new
    expect(tilebag1.draw_tiles(5)).must_equal(picked_tiles.length)
  end



  it 'After drawing 7 tiles, remaining tiles should = 93' do
    bag1 = Scrabble::TileBag.new
# how do we garuntee that these are random?
    tilebag1.draw_tiles(4)
    tilebag1.draw_tiles(2)
    tilebag1.draw_tiles(1)
    expect(bag1.tiles_remaining).must_equal(93)
  end

  it '' do
    bag1 = Scrabble::TileBag.new

    expect(bag1.draw_tiles(7)).must_equal()
  end

end

#
#
#
