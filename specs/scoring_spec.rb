require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do
  describe "#test_score_chart" do
    it "should return appropriate score for letter" do
      g = Scrabble::Scoring::SCORE_CHART[2].include?("G")
      g.must_equal(true)
    end
  end

  #does the correct score return for the given word
  describe "#self.score(word)" do
    it "should return the correct score for the given word" do
      Scrabble::Scoring.score("dog").must_equal(5)
    end

    it "should add a 50 pt bonus on top of normal word score if 7 letters" do
      Scrabble::Scoring.score("develop").must_equal(50+13)
    end

  end


  describe "#highest_score_from_array" do
    test_words = %w(dog tours develop)
  #  it "should test that array stores words" do
      # end

    it "should return the word with the highest score" do
      Scrabble::Scoring.highest_score_from(test_words).must_equal("develop")
    end

  end
  # test tie: if score of 3 letter word == score of 4 letter word, does itreturn 3 letter word

  # special case: if tie and 7 letter word used, 7 letter word wins

  # if multiple words with same score and length, pick the first onesupplied





end
