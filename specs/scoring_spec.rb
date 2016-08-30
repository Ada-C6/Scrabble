require_relative '../scoring'
require_relative 'spec_helper'

describe Scrabble::Scoring do
    trial = Scrabble::Scoring.new
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

    describe "#self.bonus(word)" do
        it "should give me 50 bonus score if the parameter input has 7 letters" do
            Scrabble::Scoring.bonus('LIONESS').must_equal(50)
        end
    end
end
