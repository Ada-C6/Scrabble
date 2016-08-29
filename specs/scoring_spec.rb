require_relative 'spec_helper' # This is needed during the test
require_relative '../scoring'

describe Scrabble::Scoring do
  describe "#initialize" do
    tile = Scrabble::Scoring.new("letter")
    it "This can create a new instance of Scoring" do
      tile.must_be_instance_of(Scrabble::Scoring)
    end


  end
end
