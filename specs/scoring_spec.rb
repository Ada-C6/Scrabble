require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do

  describe "#score" do




    it "should return the total score value for the given word" do
      score.("dog").must_equal(5)
    end
  end
end
