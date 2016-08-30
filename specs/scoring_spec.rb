require_relative 'Spec_helper'


require_relative '../lib/Scoring'

describe Scoring do



# The letters A, E, I, O, U, L, N, R, S, T equal 1 points.
# The letters D, G equal 2 point(s).
# The letters B, C, M , P equal 3 point(s).
# The letters F, H, V, W, Y equal 4 point(s)..
# The letters K equal 5 point(s)..
# The letters J, X, equals 8 point(s).
# The letters Q, Z  equals 10 point(s).

  it 'Testing Words with associated scoring metrics' do
    expect( Scoring.new("bad").score).must_equal(6)
  end
  it 'Testing Words with associated scoring metrics' do
    expect( Scoring.new("fake").score).must_equal(11)
  end

  it 'Testing Words with associated scoring metrics' do
    expect( Scoring.new("quiz").score ).must_equal(22)
  end
# 7 letter scrabble Word, testing various score combinations
  it 'Testing Words with associated scoring metrics' do
    expect( Scoring.new("anchovy").score).must_equal(68)
  end
# -----------------Tie Breaking------------------#
  # array of entered words.
# may also be self.score(word) for method instead of .score(word)?
it 'Test output in array is highest score.' do
  expect( Scoring.new([6, 11, 22, 68]).self.highest_score_from).must_equal(68)
end


# ----------------Ensure Input is wanted-------------------#
# test word enetered is a strings
# @word eventually?
# Will with the argument be a string that verifies that its a string.
# ex: "Cat":

  it 'word equals string' do
    expect( Scoring.new("word").score).must_equal(String)
  end

  it '(case insensitivity): Accepts input of upper or lower case letter returns all upcase.' do
    expect( Scoring.new("a").score).must_equal("A")
  end
# -----------------------------------#




end
