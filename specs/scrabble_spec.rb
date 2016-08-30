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

  it 'score method must return a fixnum' do
    # put this on hold rn
  end

  it 'score method must return correct score for a word' do
    expect(Scrabble::Scoring.score("hello")).must_equal(8)
  end

  it 'score method must add 50 points to score for a 7-letter word' do
    expect(Scrabble::Scoring.score("jazzmen").must_equal(84))
  end

  it 'score method should return a fixnum' do
    expect(Scrabble::Scoring.score("something").must_be_instance_of(Fixnum))
  end

  it 'score method\'s argument should only include letters' do
    expect( proc {Scrabble::Scoring.score("everything!!!")} ).must_raise(ArgumentError)
    expect( proc {Scrabble::Scoring.score("everything123")} ).must_raise(ArgumentError)
  end

end
