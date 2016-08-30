require_relative 'spec_helper'
require_relative '../Scoring.rb'

describe Scrabble::Scoring do

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



  end

end

# Scrabble::Scoring.new("word").collect_word("word")
