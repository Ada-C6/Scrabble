require_relative 'spec_helper'
require_relative '../Scoring.rb'

describe Scrabble::Scoring do

  it "should have a scoring chart" do
    Scrabble::Scoring::SCORE_CHART.wont_be_nil
  end

  describe "#initialize" do

    it "should create a new instance of Scoring" do
      Scrabble::Scoring.new.must_be_instance_of(Scrabble::Scoring)
    end

  end

  describe "#collect_word_from_user" do
    it "should pull in a parameter that is the player's word choice" do
      Scrabble::Scoring.new.must_respond_to(:word)
    end

    it "should call the store_all_game_words method" do
      Scrabble::Scoring.new.must_respond_to(:store_all_game_words)
    end
  end

  describe "#self.score" do
    it "should raise an error if the input is not a string" do
      proc { Scrabble::Scoring.score(1) }.must_raise(ArgumentError)
    end

    it "should output something, not nothing" do
      Scrabble::Scoring.score("word").wont_be_nil
    end

    it "should output something has a class of Fixnum" do
      Scrabble::Scoring.score("word").must_be_kind_of Fixnum
    end

    #A test to check if it scores a (particular) word correctly (fox = 13)
    it "should score fox as 13" do
      Scrabble::Scoring.score("fox").must_equal(13)
    end

  end

  describe "self.highest_score_from_array(array_of_words)" do

    it "should raise an error when something that isn't an array is passed in" do
      proc { Scrabble::Scoring.highest_score_from_array({}) }.must_raise(ArgumentError)
    end

    it "should raise an error when an element inside of the input array isn't a string" do
      proc { Scrabble::Scoring.highest_score_from_array( [1] )}.must_raise(ArgumentError)
    end

    it "should output something has a class of String" do
      Scrabble::Scoring.highest_score_from_array(["sdf","sdfds"]).must_be_kind_of String
    end

    it "should return the first word in a tie" do
      test_array = ["J", "X"] #J and X are both worth 8 points
      Scrabble::Scoring.highest_score_from_array(test_array).must_equal("J")
    end
  end

end

# Scrabble::Scoring.new("word").collect_word("word")
