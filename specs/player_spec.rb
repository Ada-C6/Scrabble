require_relative 'spec_helper'
require_relative '../player'

describe Scrabble::Player do

  describe "#initialize" do

    it "can create a new instance of Player" do
      Scrabble::Player.new("Shari").must_be_instance_of(Scrabble::Player)
    end

    it "should have a name property" do
      Scrabble::Player.new("Shari").must_respond_to(:name)
    end

    it "returns an array of words played by player" do
      Scrabble::Player.new("Shari").must_respond_to(:plays)
    end
  end

  describe "#play(words)" do

    it "returns the score of the word" do
      Scrabble::Player.new("Shari").play("hotdog").must_equal(11)
    end

    it "returns False if the player has won" do
      Scrabble::Player.new("Shari").play("qqqqkkj").must_equal(false)
    end
  end

  describe "#total_score" do

    it "returns the sum of scores of the played words" do
      s = Scrabble::Player.new("Shari")
      s.play("cat")
      s.play("bat")
      s.total_score.must_equal(10)
    end
  end

  describe "#won" do

    it "returns true if player has over 100 points" do
      y = Scrabble::Player.new("Yuri")
      if y.total_score == 101
        y.won?.must_equal(true)
      end
    end

    it "returns false if player score is 100 points or less" do
      k = Scrabble::Player.new("Kari")
      if k.total_score == 90
        k.won?.must_equal(false)
      end
    end

  end

  describe "#highest_scoring_word" do
    it "returns the highest scoring word played" do
      s = Scrabble::Player.new("Shari")
      s.play("zoo")
      s.play("cat")
      s.highest_scoring_word.must_equal("zoo")
    end
  end

  describe "#highest_word_score" do

    it "returns the score of the highest scoring word" do
      s = Scrabble::Player.new("Shari")
      s.play("zoo")
      s.play("cat")
      s.highest_word_score.must_equal(12)
    end
  end
end
