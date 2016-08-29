require_relative '../scoring'
require_relative 'spec_helper'

describe Scrabble::Scoring do
    describe "#initialize" do
        trial = Scrabble::Scoring.new

        it "red" do
            # this is the red test
            # trial = Scrabble::Scoring.new
            trial.must_be_instance_of(Scrabble::Scoring)
        end

        it "should have test value as 2" do
            trial.test.must_equal(2)
        end
    end

    describe "#self.score(word)" do

    end
end
