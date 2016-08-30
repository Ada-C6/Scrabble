require_relative 'spec_helper' # This is needed during the test
require_relative '../scoring'

describe Scrabble::Scoring do
  describe "#initialize" do
    tile = Scrabble::Scoring.new("letter")
    it "This can create a new instance of Scoring" do
      tile.must_be_instance_of(Scrabble::Scoring)
    end


  end

  describe "scoring" do
    it "can properly score the word 'cat'" do
      Scrabble::Scoring.score("cat").must_equal(5) # 3,1,1
    end

    it "raises ArgumentError if string is empty" do
      Scrabble::Scoring.score("").must_raise(ArgumentError)
    end



    it "raises ArgumentError if string is more than seven letters" do
      if  word.length > 7
        Scrabble::Scoring.score(word).must_raise(ArgumentError)
      end
    end


  end

  describe "highest_score_from" do
    it "can return the highest scoring word from ["cat", "mat"]" do
     Scrabble::Scoring.highest
    end

  end



end
