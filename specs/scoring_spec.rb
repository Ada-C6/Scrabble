require_relative 'Spec_helper'


require_relative '../lib/Scoring'

describe Scrabble::Scoring do
# The letters A, E, I, O, U, L, N, R, S, T equal 1 points.
# The letters D, G equal 2 point(s).
# The letters B, C, M , P equal 3 point(s).
# The letters F, H, V, W, Y equal 4 point(s)..
# The letters K equal 5 point(s)..
# The letters J, X, equals 8 point(s).
# The letters Q, Z  equals 10 point(s).

  it 'Testing Words with associated scoring metrics' do
    expect(Scrabble::Scoring.score("bad")).must_equal(6)
  end

  it 'Testing Words with associated scoring metrics' do
    expect(Scrabble::Scoring.score("fake")).must_equal(11)
  end

  it 'Testing Words with associated scoring metrics' do
    expect(Scrabble::Scoring.score("quiz")).must_equal(22)
  end
# 7 letter scrabble Word, testing various score combinations
  it 'Testing Words with associated scoring metrics' do
    expect(Scrabble::Scoring.score("anchovy")).must_equal(68)
  end
# -----------------Tie Breaking------------------#
  # array of entered words.
# may also be self.score(word) for method instead of .score(word)?
  it 'Test output in array is highest score.' do
    expect(Scrabble::Scoring.highest_score_from([6, 11, 100, 68])).must_equal(100)
  end


# ----------------Ensure Input is wanted-------------------#
# test word enetered is a strings
# @word eventually?
# Will with the argument be a string that verifies that its a string.
# ex: "Cat":

  # it 'word equals string' do
  #   expect( Scoring.new("word").score).must_equal(String)
  # end
  #
  # it '(case insensitivity): Accepts input of upper or lower case letter returns all upcase.' do
  #   expect( Scoring.new("a").score).must_equal("A")
  # end
# -----------------------------------#
  # Dealing with Ties

  # input 2 words that scored the same.
  #
  it 'Two word tie goes to the word with fewest letters' do
    expect(Scrabble::Scoring.highest_score_from(["frizzy","mezuzah", "cat", "milk"])).must_equal("frizzy")
  end

  it 'three word tie that goes to the word with fewest letters'

  do
    expect(Scrabble::Scoring.highest_score_from(["boxwood", "chintz", "bozeman", "bozeman", "dog", "litter", "bike"])).must_equal("chintz")
  end

  # this would only be relevant w/ extra points vis double or triple letter or word scores.
  # it 'tie between words of different lengths but same point value.' do
  #   expect(Scrabble::Scoring.highest_score_from(["abyss", "abrupt", "dog", "cat"]).must_equal("abyss")
  # end
  it 'tie two words of the same length and value' do
    expect(Scrabble::Scoring.highest_score_from(["nuzzle", "nozzle", "dog", "cat"])).must_equal("nuzzle")
  end


# -----------------------------------#

end
