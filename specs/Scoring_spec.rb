require_relative 'spec_helper'
require_relative '../Scoring.rb'

describe Scrabble::Scoring do

  it "should have a scoring chart" do
    Scrabble::Scoring::SCORE_CHART.wont_be_nil
  end

  # Don't need this right now either
  #  it "should have array_of_words" do
  #   :array_of_words.wont_be_nil
  # end

  describe "#initialize" do
    # let(:s) { Scrabble::Scoring.new("word") }

    it "should create a new instance of Scoring" do
      Scrabble::Scoring.new.must_be_instance_of(Scrabble::Scoring)
    end

    # it "should initialize with a word" do
    #   Scrabble::Scoring.new.must_respond_to(:word)
    # end

    ## assuming we initialize with no parameter
    # it "should call collect_word method" do
    #   Scrabble::Scoring.new("word").must_respond_to(:collect_word)
    # end

    # it "should pass in a string" do
    #   (:word).must_be_kind_of(String)
    # end

  end

  describe "#collect_word_from_user" do
    it "should pull in a parameter that is the player's word choice" do
      Scrabble::Scoring.new.must_respond_to(:word)
    end

    # it "should call the store_all_game_words method" do
    #   Scrabble::Scoring.new.must_respond_to(:store_all_game_words)
    # end
  end

  describe "#self.score" do
    it "should have an array of letters" do
      :letter_array.wont_be_nil
    end

    it "should have an array for a word's score" do
      :single_word_score.wont_be_nil
    end

    it "should have a word_score_array that's only filled with numbers" do
      :single_word_score.must_be_kind_of Symbol
    end

    it "should check to see if everything in letter_array is upcase letter" do
      #Blah
    end

  end


  # Defunct collect game words into arrya (We don't need this right now, hopefully never)
  # describe "#store_all_game_words" do
  #   it "should accept a parameter" do
  #     Scrabble::Scoring.new.must_respond_to(:word)
  #   end
  #   it "should add a word to the array" do
  #     c = Scrabble::Scoring.new
  #     original_length = c.array_of_words.length
  #     collect_word_from_user("flibble")
  #     Scrabble::Scoring.array_of_words.length.must_equal(original_length + 1)
  #   end
  # end

end

# Scrabble::Scoring.new("word").collect_word("word")
