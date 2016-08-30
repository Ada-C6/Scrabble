require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do

  describe "#scoring" do

    it "should return the total score value for the given word" do
      Scrabble::Scoring.score("DOG").must_equal(5)
    end

    a = Scrabble::Scoring.new

    it "should throw an error when an invalid parameter is supplied" do
      proc {Scrabble::Scoring.score("123")}.must_raise(ArgumentError)
    end



  end
end
