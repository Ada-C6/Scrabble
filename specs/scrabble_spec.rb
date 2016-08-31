# Make red button test!!!

require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do
    it "has a constant that is a hash" do
      Scrabble::Scoring::SCORE_TABLE.must_be_instance_of(Hash)
    end
    it "letters are assigned to scores" do
      Scrabble::Scoring::SCORE_TABLE[10].must_equal(["Q", "Z"])
      Scrabble::Scoring::SCORE_TABLE[1].must_equal(%w(A E I O U L N R S T))
      Scrabble::Scoring::SCORE_TABLE[2].must_equal(%w(D G))
      Scrabble::Scoring::SCORE_TABLE[3].must_equal(%w(B C M P))
      Scrabble::Scoring::SCORE_TABLE[4].must_equal(%w(F H V W Y))
      Scrabble::Scoring::SCORE_TABLE[5].must_equal(["K"])
      Scrabble::Scoring::SCORE_TABLE[8].must_equal(["J", "X"])
    end
    describe "#initialize" do
        let(:score) {Scrabble::Scoring.new}
        it "can create a new instance of Scoring" do
            score.must_be_instance_of(Scrabble::Scoring)
        end
    end

    describe "score(word)" do
        it "ought to throw an Argument Error if the parameter contains non-letters" do
            proc { Scrabble::Scoring.score("1")}.must_raise(ArgumentError)
        end

        it "must throw an ArgumentError if word is not 1-7 characters long" do
          proc { Scrabble::Scoring.score("California")}.must_raise(ArgumentError)
          proc { Scrabble::Scoring.score("")}.must_raise(ArgumentError)
        end

        it "must score words properly" do
          Scrabble::Scoring.score("fox").must_equal(13)
        end

        it "will add 50 point bonus for a seven letter word" do
            Scrabble::Scoring.score("ghesrso").must_equal(61)
        end
    end

    describe "highest_score_from(words_array)" do
        it "will return a String" do
            Scrabble::Scoring.highest_score_from(["cat"]).must_be_instance_of(String)
        end

        it "will return the highest score word if no ties" do
          Scrabble::Scoring.highest_score_from(["cat", "soup"]).must_equal("soup")
        end

        it "will return the word with fewer letters in case of a tied score of words less than seven letters" do
          Scrabble::Scoring.highest_score_from(["rats", "tag"]).must_equal("tag")
        end

        it "returns seven letter word if tied with non-seven-letter word" do
          Scrabble::Scoring.highest_score_from(["zqzqzq", "penguin"]).must_equal("penguin")
        end

        it "returns first word in supplied list in case of tied score and length" do
          Scrabble::Scoring.highest_score_from(["tags", "rags", "legs", "at"]).must_equal("tags")
        end
    end

end
