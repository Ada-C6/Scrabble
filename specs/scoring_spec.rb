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
  end

  describe "highest_score_from" do

    it "can return the highest scoring word from #{["cat", "mat"]}" do
      skip
      Scrabble::Scoring.highest_score_from.must_equal(2)
    end



    it "recognizes when two words have the same score and returns the first word in the array" do
        skip
      Scrabble::Scoring.highest_score_from.
    end

  end
end
end
