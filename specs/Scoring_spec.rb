require_relative 'spec_helper'
require_relative '../Scoring.rb'

describe Scrabble::Scoring do

  it "should have a scoring chart" do
    Scrabble::Scoring::SCORE_CHART.wont_be_nil
  end

  it "should have array_of_words" do
    :array_of_words.wont_be_nil
  end

  describe "#initialize" do
    # let(:s) { Scrabble::Scoring.new("word") }

    it "should create a new instance of Scoring" do
      Scrabble::Scoring.new("word").must_be_instance_of(Scrabble::Scoring)
    end

    it "should initialize with a word" do
      Scrabble::Scoring.new("word").must_respond_to(:word)
    end

    it "should call collect_word method" do
      Scrabble::Scoring.new("word").must_respond_to(:collect_word)
    end

    # it "should pass in a string" do
    #   (:word).must_be_kind_of(String)
    # end

  end

  describe "#collect_word" do

    it "should add a word to the array" do
      scrabble_scorecard = Scrabble::Scoring.new()
      collect_word(flibble)
    end

  end

end

# Scrabble::Scoring.new("word").collect_word("word")
