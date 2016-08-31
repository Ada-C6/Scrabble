require_relative '../lib/Scrabble.rb'
require_relative 'spec_helper.rb'

describe "Testing Scrabble" do

  it "It must raise an ArgumentError if given a Fixnum" do
    expect (proc { Scrabble::Scoring.start_word(11)} ).must_raise ArgumentError
  end

  it "Testing to remove case sensitivity" do
    expect(Scrabble::Scoring.start_word("HeLLo")  ).must_equal("HELLO")
  end

  it "Testing to make sure score is correct" do
    expect(Scrabble::Scoring.score("potato")  ).must_equal(8)
  end

  it "Testing to make sure 7 tiles gets an extra 50 points" do
    expect(Scrabble::Scoring.score("majesty")  ).must_equal(69)
  end

  it "Testing to make sure the highest scoring word(s) are returned" do
    expect(Scrabble::Scoring.score_highest({"HELLO": 8, "CAT": 5, "MAJESTY": 69})  ).must_equal("MAJESTY")
  end

  it "Testing to make sure tie returns word with exactly 7 characters" do
    expect(Scrabble::Scoring.hash({"ROASTED": 9, "KIP":9})  ).must_equal("ROASTED")
  end

  it "Testing to make sure tie returns shorter word if neither word has a length of 7" do
    expect(Scrabble::Scoring.hash({"ROASTED": 9, "APPLE":9})  ).must_equal("APPLE")
  end




  # it "Testing to make sure all tied words are returned" do
  #   expect(Scrabble::Scoring.score_highest({"HELLO": 8, "POTATO": 8, "CAT": 5})  ).must_equal("HELLO", "POTATO")
  # end

end
