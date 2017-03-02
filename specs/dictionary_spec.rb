require_relative 'spec_helper'
require_relative '../dictionary'

describe Scrabble::Dictionary do
  describe "DICTIONARY" do
    it "should be an Array" do
      Scrabble::Dictionary::DICTIONARY.must_be_kind_of(Array)
    end
  end

  describe "#word_valid?" do
    it "should return TRUE if the word played is from our dictionary" do
      word = "CRAZY"
      Scrabble::Dictionary.word_valid?(word).must_equal(true)
    end

    it "should return False if the word played is not from our dictionary" do
      word = "I"
      Scrabble::Dictionary.word_valid?(word).must_equal(false)
    end

    it "should return true if downcase is input as a word" do
      word = "crazy"
      Scrabble::Dictionary.word_valid?(word).must_equal(true)
    end

    it "should return false if the word played is from our dictionary" do
      word = "CRAZY CATLADY"
      proc {Scrabble::Dictionary.word_valid?(word)}.must_raise(ArgumentError)
      # Scrabble::Dictionary.word_valid?(word)
    end
  end
end
