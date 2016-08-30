require_relative 'spec_helper'
require_relative '../Scoring.rb'

describe Scrabble::Scoring do

  describe "#initialize" do
    # let(:s) { Scrabble::Scoring.new("word") }

    it "should create a new instance of Scoring" do
      Scrabble::Scoring.new("word").must_be_instance_of(Scrabble::Scoring)
    end

    # it "should initialize with a word" do
    #
    # end


  end

end
