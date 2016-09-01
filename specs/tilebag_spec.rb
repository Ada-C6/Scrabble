require_relative 'spec_helper'
require_relative '../scrabble' # this is the module file
require_relative '../lib/scrabble_scoring'
require_relative '../lib/scrabble_player'
require_relative '../lib/tilebag'

describe 'testing tilebag class' do

  it 'testing that Tilebag exists' do
    # skip
    expect(Scrabble::Tilebag.must_be_instance_of(Class))
  end

  it 'LETTER_ARRAY constant must return number of letters remaining for a given letter' do
    # skip
    expect(Scrabble::LETTER_ARRAY.assoc("A").length.must_equal(9))
    expect(Scrabble::LETTER_ARRAY.assoc("E").length.must_equal(12))
    expect(Scrabble::LETTER_ARRAY.assoc("J").length.must_equal(1))
    expect(Scrabble::LETTER_ARRAY.assoc("L").length.must_equal(4))
  end


  it 'new instance of Tilebag should have a @tiles instance variable that is equivalent to the LETTER_ARRAY constant' do
    # skip
    bag_one = Scrabble::Tilebag.new
    expect(bag_one.tiles.must_equal(Scrabble::LETTER_ARRAY))
  end

  it 'draw_tiles must return number of random tiles in parameter' do
    # skip
    bag_two = Scrabble::Tilebag.new
    rack_two = bag_two.draw_tiles(4)
    expect(rack_two.length.must_equal(4))
  end

  it 'draw_tiles must return an array' do
    # skip
    bag_three = Scrabble::Tilebag.new
    rack_three = bag_three.draw_tiles(4)
    expect(rack_three.must_be_instance_of(Array))
  end

  it 'draw_tiles must remove the tiles chosen from @tiles' do
    # skip
    bag_four = Scrabble::Tilebag.new
    bag_four.draw_tiles(4)
    expect(bag_four.tiles.flatten.length.must_equal(94)) # total length of tiles initially is 98, so if you draw 4 it should equal 94
  end



end #end of describe
