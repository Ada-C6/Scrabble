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
  #  it "should test that array stores words" do
      # end

    it "should return the word with the highest score" do
      test_words = %w(dog tours develop)
      Scrabble::Scoring.highest_score_from(test_words).must_equal("develop")
    end
    # test tie: if score of 3 letter word == score of 4 letter word, does it return 3 letter word
    it "should return the word with the shorter length if there is a tie" do
      test_words = %w(dog tours hi go)
      Scrabble::Scoring.highest_score_from(test_words).must_equal("hi")
    end
    # special case: if tie and 7 letter word used, 7 letter word wins
    it "should return the 7 letter word if there is a tie" do
      test_words = %w(zzzzzx aaaaaad wut)
      Scrabble::Scoring.highest_score_from(test_words).must_equal("aaaaaad")
    end

    # if multiple words with same score and length, pick the first onesupplied
    it "should return the first word supplied in the case of tie of both score and length" do
      
    end

  end








end
