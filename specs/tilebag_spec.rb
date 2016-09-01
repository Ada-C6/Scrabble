require_relative 'spec_helper'
require_relative '../scrabble' # this is the module file
require_relative '../lib/scrabble_scoring'
require_relative '../lib/scrabble_player'
require_relative '../lib/tilebag'

describe 'testing tilebag class' do

  it 'testing that tilebag exist' do
    expect(Scrabble::Tilebag.must_be_instance_of(Class))
  end

  it 'LETTER_ARRAY constant Must return correct letter and number of letters remaining' do
    expect(Scrabble::LETTER_ARRAY.rassoc("A").length.must_equal(9))
    # expect(Scrabble::LETTER_ARRAY[:D]).must_equal(4)
    # expect(Scrabble::LETTER_ARRAY[:B]).must_equal(2)
    # expect(Scrabble::LETTER_ARRAY[:F]).must_equal(2)
    # expect(Scrabble::LETTER_ARRAY[:K]).must_equal(1)
    # expect(Scrabble::LETTER_ARRAY[:X]).must_equal(1)
    # expect(Scrabble::LETTER_ARRAY[:Q]).must_equal(1)
  end



end #end of describe
