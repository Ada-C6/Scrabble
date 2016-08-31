require_relative '../scoring'
require_relative 'spec_helper'

describe Scrabble::Scoring do
    # trial = Scrabble::Scoring.new
    describe "#initialize" do
    end

    describe "#self.score(word)" do
        it "should raise an error for invalid parameter input" do
            proc { Scrabble::Scoring.score(123) }.must_raise(ArgumentError)
        end

        it 'should return the correct value for a letter in parameter input' do
            Scrabble::Scoring.score('L').must_equal(1)
        end

        it 'should return the correct value for a string in parameter input' do
            Scrabble::Scoring.score('LIONESS').must_equal(57)
        end
    end

    describe "self.bonus(word)" do
        it "should give me 50 bonus score if the parameter input has 7 letters" do
            Scrabble::Scoring.bonus('LIONESS').must_equal(50)
        end
    end

    describe "self.highest_score_from(array_of_words)" do
        it "should raise an error for invalid parameter input" do
            proc { Scrabble::Scoring.highest_score_from(123) }.must_raise(ArgumentError)
        end

        it "should raise an error for an empty array input" do
            proc { Scrabble::Scoring.highest_score_from([]) }.must_raise(ArgumentError)
        end

        it "should return the winner when an array was passed in, and we have only 1 highest scoring word" do
            Scrabble::Scoring.highest_score_from(['CAT', 'COW', 'LIONESS']).must_equal('LIONESS')
        end

        it "should return the winner when an array was passed in, and we have more than one highest scoring words, one of which has 7 letters" do
            Scrabble::Scoring.highest_score_from(['CAT', 'QQQQQJ', 'AAAAAAG']).must_equal('AAAAAAG')
        end

        it "should return the winner when an array was passed in, and we have more than one highest scoring words, none of them has 7 letters, but one of them has a shorter length than the others" do
            Scrabble::Scoring.highest_score_from(['CAT', 'QQQQJ', 'QQQQBK']).must_equal('QQQQJ')
        end

        it "should return the winner when an array was passed in, and we have more than one highest scoring words, none of them has 7 letters, all of them have the same length, and we decide the winner based on the smallest index in the array" do
            Scrabble::Scoring.highest_score_from(['CAT', 'QQQQJ', 'QQQQX']).must_equal('QQQQJ')
        end
    end
end
