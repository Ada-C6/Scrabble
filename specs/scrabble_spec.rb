# Make red button test!!!

require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do
    describe "#initialize" do
        let(:score) {Scoring.new}
        it "can create a new instance of Scoring" do
            score.must_be_instance_of(Scoring)
        end
    end
end
