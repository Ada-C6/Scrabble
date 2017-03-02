require_relative 'spec_helper' # This is needed during the test
require_relative '../scoring'

describe Scrabble::Scoring do

  describe "#initialize" do
    tile = Scrabble::Scoring.new
    it "This can create a new instance of Scoring" do
      tile.must_be_instance_of(Scrabble::Scoring)
    end
  end

  describe "scoring" do
    it "can properly score the word 'cat'" do
      Scrabble::Scoring.score("CAT").must_equal(5) # 3,1,1
    end

    it "score will be caluclated for argument passed regardless of case" do
      Scrabble::Scoring.score("CAT").must_equal(Scrabble::Scoring.score("cat"))
    end

    it "raises ArgumentError if string is empty" do
      proc { Scrabble::Scoring.score("")}.must_raise(ArgumentError)
    end

    it "raises ArgumentError if string is more than seven letters" do
        proc { Scrabble::Scoring.score("neverminds")}.must_raise(ArgumentError)
    end

    it "adds 50 points if the string is 7 characters" do
      Scrabble::Scoring.score("zzzzzzz").must_equal(120)
    end
  end

  describe "highest_score_from" do

    it "can return the highest scoring word from #{["cat", "hat"]}" do
      Scrabble::Scoring.highest_score_from(["cat", "hat"]).must_equal("hat")
    end

    it "recognizes that the shorter word with same value should win" do
      Scrabble::Scoring.highest_score_from(["trees", "dog"]).must_equal("dog")
    end
    it "will declare the 7 letter word the winner over the shorter word" do
      Scrabble::Scoring.highest_score_from(["foursts", "qqzzqq"]).must_equal("foursts")
    end
    it "will return the first word even if it has the same value and tiles as another" do
      Scrabble::Scoring.highest_score_from(["dog", "pou", "boy", "cow"]).must_equal("boy")
    end
  end
end
