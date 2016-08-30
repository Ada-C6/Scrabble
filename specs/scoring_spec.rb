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

    end
end
