require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do
  describe "#initialize" do
    it "can create a new instance of Scoring" do
      score = Scrabble::Scoring.new
      score.must_be_instance_of(Scrabble::Scoring)
    end

    it "should have 26 English Alphabet letters in the scoring chart" do
      Scrabble::Scoring::POINTS.length.must_equal(26)
      # Scrabble::Scoring::POINTS.must_include "A"
    end

    # it "should have a score corresponding to each letter" do
    #   total_value = Scrabble::Scoring::POINTS.values
    #   total_value.reduce(:+)
    #   total_value.must_equal
    # end




  end
end
