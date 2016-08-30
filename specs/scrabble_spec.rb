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
    describe "#self.score(word)" do
        it "ought to throw an Argument Error if the parameter contains non-letters" do
            proc { Scrabble::Scoring.score("1")}.must_raise(ArgumentError)
        end
    end

end
