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
      p.plays.must_equal(["CAT", "BIRD"])
    end

  end

  describe "play" do
    it "should add the input word to the plays Array" do
      p.plays = []
      p.play("dog")
      p.plays.must_equal(["DOG"])
    end
  end
    describe "#total_score" do

      it "should return the total score of played words" do
      p.plays =[]
      p.play("cat")
      p.play("birdand")
      p.play("home")
      p.total_score.must_equal(75)
    end
  end
end
