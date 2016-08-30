require_relative '../lib/Scrabble.rb'
require_relative 'spec_helper.rb'

describe "Testing Scrabble" do

  it "It must raise an ArgumentError if given a Fixnum" do

       expect (proc { Scrabble::Scoring.score(11)} ).must_raise ArgumentError

  end

  # it "It must raise an ArgumentError if LETTER_SCORES[char] is not a Fixnum" do
  #   expect (proc { Scrabble::Scoring.score("hellO")} ).must_raise ArgumentError
  # end

  it "Testing to remove case sensitivity" do

      expect(Scrabble::Scoring.score("HeLLo")  ).must_equal(8)
  end

  it "Testing to make sure score is correct" do
      expect(Scrabble::Scoring.score("potato")  ).must_equal(8)
  end
end
