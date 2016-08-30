require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do

  describe "#scoring" do

    it "should return the total score value for the given word" do
      score.("dog").must_equal(5)
    end

    a = Scrabble::Scoring.new

    it "should throw an error when an invalid parameter is supplied" do
      proc {a.score(123)}.must_raise(ArgumentError)
    end

    

  end
end
