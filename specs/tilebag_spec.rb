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
    tilebag1.draw_tiles(2)
    expect(tilebag1.draw_tiles(2)).must_equal(ArgumentError)
  end
#5 # how do you test to see if error happens, if you aren't able to have more than 7 tiles?
  # it "Throw an error if you try to draw more than there are left in the bag." do
  #   tilebag1 = Scrabble::TileBag.new
  #   tilebag1.draw_tiles(50)
  #   tilebag1.draw_tiles(48)
  #   expect(tilebag1.draw_tiles(5)).must_equal("You can't draw that number of tiles. There are not enough tiles left in the bag.")
  # end



end
