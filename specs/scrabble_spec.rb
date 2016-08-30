require_relative 'spec_helper'
require_relative '../scrabble' # this is the module file
require_relative '../lib/scrabble_scoring'

describe 'testing scrabble module' do

  it 'Must return correct key value' do
    expect(Scrabble::SCORE_HASH[:A]).must_equal(1)
    expect(Scrabble::SCORE_HASH[:D]).must_equal(2)
    expect(Scrabble::SCORE_HASH[:B]).must_equal(3)
    expect(Scrabble::SCORE_HASH[:F]).must_equal(4)
    expect(Scrabble::SCORE_HASH[:K]).must_equal(5)
    expect(Scrabble::SCORE_HASH[:X]).must_equal(8)
    expect(Scrabble::SCORE_HASH[:Q]).must_equal(10)
  end

end
