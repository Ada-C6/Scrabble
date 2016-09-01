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
    it "should raise an error when tile is invalid" do
      proc { Scoring.score('3') }.must_raise(ArgumentError)
      proc { Scoring.score(' ') }.must_raise(ArgumentError)
    end
    it "method will return a fixnum" do
      Scoring.score("string").must_be_instance_of(Fixnum)
    end

    it "must add up values of letters in word correctly" do
      Scoring.score("STRING").must_equal(7)
    end

    it "must add 50 points to score for seven-letter-words" do
      Scoring.score("PIZZAZZ").must_equal(95)
    end
  end

  describe "#self.highest_score_from(array_of_words)" do

    it "method will return a string" do
      Scoring.highest_score_from(["xena", "toy", "dog"]).must_be_instance_of(String)
    end
    #Tiebreaker tests
    it "will return the shortest word within an array of equal scored words" do
      Scoring.highest_score_from(["gels", "cat", "long"]).must_equal("cat")
    end

    it "will return the word with the highest score and length of 7 in an an array" do
      Scoring.highest_score_from(["qzqzqz", "aaaaaah"]).must_equal("aaaaaah")
    end

  end

end
end
