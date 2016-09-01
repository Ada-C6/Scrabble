require_relative 'spec_helper'
require_relative '../tilebag.rb'

describe Scrabble::Tilebag do
  describe "#initialize" do
    it "should create a new instance of Tilebag" do
      Scrabble::Tilebag.new.must_be_instance_of(Scrabble::Tilebag)
    end

    it "should initialize with 98 number of tiles" do
      Scrabble::Tilebag.new.all_tiles.values.reduce(:+).must_equal(98)
    end

    it "should initialize with 26 letters" do
      Scrabble::Tilebag.new.all_tiles.length.must_equal(26)
    end
  end

end
