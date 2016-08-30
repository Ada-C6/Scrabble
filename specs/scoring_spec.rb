require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do
  describe "#test_score_chart" do
    it "should return appropriate score for letter" do
      g = Scrabble::Scoring::SCORE_CHART[2].include?("G")
      g.must_equal(true)
    end
  end
end
