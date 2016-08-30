require_relative "../lib/scoring.rb"
require_relative 'spec_helper'
module Scrabble
describe Scoring do

  describe "#initialize" do
    let(:scoring) {Scoring.new(:word) }

    it "can create an instance of Scoring" do
      scoring.must_be_instance_of(Scoring)
    end

    it "has a word attribute" do
    scoring.must_respond_to(:word)
    end
  end

  describe "#self.score(word)" do
  #let(:scoring) {Scoring.score("cat") }

    it "method will return a fixnum" do
      Scoring.score("string").must_be_instance_of(Fixnum)
    end

    it "must add up values of letters in word correctly" do
      Scoring.score("STRING").must_equal(7)
    end

# @todo we need to make sure the score is added correctly, using an each for an array of words
  end

  describe "#self.highest_score_from(array_of_words)" do

    it "method will return a string" do
      Scoring.highest_score_from(["xena", "toy", "dog"]).must_be_instance_of(String)
    end

  end

end
end
