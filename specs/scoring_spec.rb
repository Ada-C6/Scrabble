require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do

  describe "#scoring" do

    it "should return the total score value for the given word" do
      Scrabble::Scoring.score("DOG").must_equal(5)
    end

    it "should throw an error when an invalid parameter is supplied" do
      proc {Scrabble::Scoring.score("123")}.must_raise(ArgumentError)
    end

    it "should give a 50 point bonus for seven letter words" do
      Scrabble::Scoring.score("bunnies").must_equal(59)
    end

  end

  describe "#highest_score_from" do

    it "should choose the shortest word in case of a tie" do
      Scrabble::Scoring.highest_score_from(["aeoiu", "dog", "deee"]).must_equal("DOG")
    end

    it "should choose the first 7 letter word over a shorter word in case of a tie" do
      Scrabble::Scoring.highest_score_from(["aaaaaaa", "ddda", "eeeeeee"]).must_equal("AAAAAAA")
    end

  end

end
