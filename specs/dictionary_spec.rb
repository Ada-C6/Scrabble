require_relative 'spec_helper'
require_relative '../dictionary'

describe Scrabble::Dictionary do
  describe "DICTIONARY" do
    it "should be an Array" do
      Scrabble::Dictionary::DICTIONARY.must_be_kind_of(Array)
    end
  end

  describe "#word_valid?" do
    it "should return TRUE if the word played is a valid word from the dictionary" do
      Scrabble::Dictionary.word_valid?.must_equal(true)
    end
  end
end

#### technically, the words in the dictionary shouldn't contain more occurrences of certain letters than available in the tile bag, for example, the word "buzz" cannot be in the dictionary because "z" is only in the tile bag once, but this is hard. so, no.
