require_relative 'spec_helper'
require_relative '../scrabble' # this is the module file
require_relative '../lib/scrabble_scoring'
require_relative '../lib/scrabble_player'
require_relative '../lib/tilebag'

describe 'testing tilebag class' do

  it 'testing that tilebag exist' do
    expect(Scrabble::Tilebag.must_be_instance_of(Class))
  end

  it 'Must return correct key value pair of letter and number of letters' do
    expect(Scrabble::LETTER_HASH[:A]).must_equal(9)
    expect(Scrabble::LETTER_HASH[:D]).must_equal(4)
    expect(Scrabble::LETTER_HASH[:B]).must_equal(2)
    expect(Scrabble::LETTER_HASH[:F]).must_equal(2)
    expect(Scrabble::LETTER_HASH[:K]).must_equal(1)
    expect(Scrabble::LETTER_HASH[:X]).must_equal(1)
    expect(Scrabble::LETTER_HASH[:Q]).must_equal(1)
  end



end#end of spec
