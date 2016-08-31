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

# ----------------Ensure Input is what we wanted-------------------#
# test word entered is a strings
# @word eventually?
# Will with the argument be a string that verifies that its a string.
# ex: "Cat":
  # phase II 
  # it 'word entered must equal string' do
  #   expect( Scrabble::Scoring.score("word")).must_equal(String)
  # end

  it 'word entered should not eqaul nil' do
    expect(Scrabble::Scoring.score(nil)).must_equal(0)
  end
  #phase II
  # it '(case insensitivity): Accepts input of upper or lower case letter returns all upcase.' do
  #   expect(Scrabble::Scoring.score("a")).must_equal("A")
  # end

# -----------------------------------#
  # Dealing with Ties

  it 'Two word tie goes to the word with fewest letters' do
    expect(Scrabble::Scoring.highest_score_from(["biz","quasi", "cat", "milk"])).must_equal("biz")
  end

  it 'three word tie that goes to the word with fewest letters'do
    expect(Scrabble::Scoring.highest_score_from(["biz","quasi", "quid", "cat", "milk"])).must_equal("biz")
  end

  it 'tie between words of length 7 and another word of smaller length with same point value.' do
    expect(Scrabble::Scoring.highest_score_from(["sizzles", "fuzz", "dog", "cat"])).must_equal("sizzles")
  end

  it 'tie two words of the same length and value' do
    expect(Scrabble::Scoring.highest_score_from(["nuzzle", "nozzle", "nizzle", "dog", "cat"])).must_equal("nuzzle")
  end

# -----------------------------------#

end
