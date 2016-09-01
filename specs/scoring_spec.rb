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

    it "should have a total score corresponding to each letter's score" do
      sum = 0
      Scrabble::Scoring::POINTS.each do |k, v|
        sum += v
      end
      sum.must_equal (84)
    end
  end

  describe "score" do
    it "sums up scores of each word" do
      Scrabble::Scoring.new
      score_test = {}
      score_test["HOUSE"] = 8
      score_test["ANIMAL"] = 8
      score_test["DOG"] = 5
      score_test["GORILLA"] = 58

      score_test.each do |k, v|
        Scrabble::Scoring.score(k).must_equal(v)
      end
    end

    it "should add 50 points if the word length is 7 letters" do
      Scrabble::Scoring.new
      Scrabble::Scoring.score("GORILLA").must_equal(58)
    end
  end

  describe "highest_score" do
    it "should show the highest value and associated key" do
      Scrabble::Scoring.new
      highest_test = []
      highest_test << "ANIMAL"
      highest_test << "DOG"
      highest_test << "GORILLA"
      Scrabble::Scoring.highest_score_from(highest_test).must_equal("GORILLA")
    end

    it "in a tie, it should prefer fewer tiles" do
      Scrabble::Scoring.new
      tile_test = []
      tile_test  << "LINES"
      tile_test  << "DOG"
      tile_test  << "RAT"
      Scrabble::Scoring.highest_score_from(tile_test).must_equal("DOG")
    end

    it "in a tie, it should prefer a word with seven characters" do
      Scrabble::Scoring.new
      seven_test = []
      seven_test  << "QQQQQJ"
      seven_test  << "GORILLA"
      seven_test  << "RAT"
      Scrabble::Scoring.highest_score_from(seven_test).must_equal("GORILLA")
    end

    it "in a tie (same length and score), it should prefer first entry" do
      Scrabble::Scoring.new
      entry_test = []
      entry_test  << "RAN"
      entry_test  << "RAT"
      Scrabble::Scoring.highest_score_from(entry_test).must_equal("RAN")
    end

  end
end
