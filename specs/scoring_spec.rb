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
    end

    # not a 100% accurate test of each letter's value, but the most efficient idea we could come up with aside from checking every letter's score individually
    it "should have a total score corresponding to each letter's score" do
      sum_array = []
      Scrabble::Scoring::POINTS.each do |letter|
        sum_array += letter.values
      end
      sum_array.reduce(:+).must_equal (84)
    end

    it "sums up scores of each word" do
      score_test = {}
      score_test["HOUSE"] = 8
      #score_test[""] = 
    end


  end
end
