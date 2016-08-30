require_relative "../lib/scoring.rb"
require_relative 'spec_helper'
module Scrabble
describe Scoring do

  describe "#initialize" do
    let(:scoring) {Scoring.new(:word) }

    it "can create an instance of Scoring" do
      scoring.must_be_instance_of(Scoring)
    end

    it "has a word attribute" do
    scoring.must_respond_to(:word)
    end
  end

  describe "#self.score(word)" do
  #let(:scoring) {Scoring.new("string") }

    it "method will return a fixnum" do
      Scoring.score("string").must_be_instance_of(Fixnum)
    end

  end

end
end
