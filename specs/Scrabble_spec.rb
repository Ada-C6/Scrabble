require_relative '../lib/Scrabble.rb'
require_relative 'spec_helper.rb'

describe "Testing Scrabble" do

  it "It must raise an ArgumentError if given a Fixnum" do
    expect (proc { Scrabble::Scoring.capitalize_word(11)} ).must_raise ArgumentError
  end

  it "Testing to remove case sensitivity" do
    expect(Scrabble::Scoring.capitalize_word("HeLLo")  ).must_equal("HELLO")
  end

  it "Testing to make sure score is correct" do
    expect(Scrabble::Scoring.score("potato")  ).must_equal(8)
  end

  it "Testing to make sure 7 tiles gets an extra 50 points" do
    expect(Scrabble::Scoring.score("majesty")  ).must_equal(69)
  end

  ##########

  it "Testing to make sure the highest scoring word(s) are returned" do
    expect(Scrabble::Scoring.score_highest(["HELLO", "APPLE", "PET"])  ).must_equal("APPLE")
  end

  it "Testing to make sure tie returns word with exactly 7 characters - ROUND 1" do
    expect(Scrabble::Scoring.score_highest(["COASTED", "ZZZZZZ"])  ).must_equal("COASTED")
  end

  it "Testing to make sure tie returns word with exactly 7 characters - ROUND 2 swapped indices" do
    expect(Scrabble::Scoring.score_highest(["ZZZZZZ", "COASTED"])  ).must_equal("COASTED")
  end

  it "Testing to make sure tie returns shorter word if neither are 7 letters long" do
    expect(Scrabble::Scoring.score_highest(["POTATO", "HELLO"])  ).must_equal("HELLO")
  end

  it "Testing to make sure tie returns first word if both are 7 letters long" do
    expect(Scrabble::Scoring.score_highest(["OOOOOOO", "AAAAAAA"])  ).must_equal("OOOOOOO")
  end

  it "Testing to make sure tie returns first word if words are same score and length and not 7 letters long" do
    expect(Scrabble::Scoring.score_highest(["IT", "AS", "IN"])  ).must_equal("IT")
  end

end
