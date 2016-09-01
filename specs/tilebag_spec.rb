require_relative 'spec_helper'
require_relative '../scrabble' # this is the module file
require_relative '../lib/scrabble_scoring'
require_relative '../lib/scrabble_player'
require_relative '../lib/tilebag'

describe 'testing tilebag class' do

  it 'testing that Tilebag exists' do
    expect(Scrabble::Tilebag.must_be_instance_of(Class))
  end

  it 'LETTER_ARRAY constant must return number of letters remaining for a given letter' do
    expect(Scrabble::LETTER_ARRAY.assoc("A").length.must_equal(9))
    expect(Scrabble::LETTER_ARRAY.assoc("E").length.must_equal(12))
    expect(Scrabble::LETTER_ARRAY.assoc("J").length.must_equal(1))
    expect(Scrabble::LETTER_ARRAY.assoc("L").length.must_equal(4))
  end


  it 'new instance of Tilebag should have a @tiles instance variable that is equivalent to the LETTER_ARRAY constant' do
    bag = Tilebag.new
    expect(bag.must_equal(Scrabble::LETTER_ARRAY))
  end

end #end of describe
