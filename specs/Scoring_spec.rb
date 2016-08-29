require_relative 'spec_helper'
require_relative '../Scoring.rb'

describe Scrabble::Scoring do
  # scoring = Scrabble::Scoring.new(word)

  describe "#initialize" do
    it "should create a new instance of Scoring" do
      Scrabble::Scoring.new.must_be_an_instance_of(Scoring)
    end
  end

end
