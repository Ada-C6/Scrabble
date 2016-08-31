require_relative 'spec_helper'
require_relative '../player'

describe Scrabble::Player do

  p = Scrabble::Player.new("name")

  describe "initialize" do

    it "should initialize with exactly one parameter (name)" do
      p.must_respond_to(:name)
    end

  end

  describe "plays" do

    it "should return an Array of the words played by the player" do
      p.plays = []
      p.play("cat")
      p.play("bird")
      p.plays.must_equal(["cat", "bird"])
    end

  end

  describe "play" do
    it "should add the input word to the plays Array" do
      p.plays = []
      p.play("dog")
      p.plays.must_equal(["dog"])
    end
  end

end
