require_relative 'spec_helper'
require_relative '../player'
require_relative '../scoring'

describe Scrabble::Player do
  describe "#initialize" do
    it "can initialize a new instance of Player" do
      player = Scrabble::Player.new(:name)
      player.must_be_instance_of(Scrabble::Player)
    end
  end

  describe "#plays" do
    it "should have an array of played words" do
      player = Scrabble::Player.new("Jen")
      player.play("BEAR")
      player.play("CHEETAH")
      player.play("RAT")
      player.play("CAT")
      player.plays.must_equal(["BEAR", "CHEETAH", "RAT", "CAT"])
    end
  end

  describe "#play(word)" do
    it "should put the word into the plays array" do
      player = Scrabble::Player.new("Jen")
      player.play("DOG")
      player.plays.must_include("DOG")
    end

    it "should return false if player has already won game else return the score" do
      player = Scrabble::Player.new("Jen")
      if player.won?
        player.play(word).must_equal(false)
      else
        Scrabble::Scoring.new
        Scrabble::Scoring.score("BEAR").must_equal(6)
      end
    end
  end

  describe "#total_score" do
    it "should return the sum of the scores of played words" do
      player = Scrabble::Player.new("Jen")
      player.play("BEAR")
      player.play("CHEETAH")
      player.play("RAT")
      player.play("CAT")
      player.total_score.must_equal(79)
    end
  end

  describe "#won?" do
    it "should display if the person has won the game or not" do
      player = Scrabble::Player.new("Jen")
      if player.total_score >= 100
        player.won?.must_equal(true)
      else
        player.won?.must_equal(false)
      end
    end
  end

  describe "#highest_scoring_word" do
    it "return the highest scoring played word by a player" do
      Scrabble::Scoring.new
      player = Scrabble::Player.new("Jen")
      player.play("BEAR")
      player.play("CHEETAH")
      player.play("RAT")
      player.play("CAT")
      player.highest_scoring_word.must_equal("CHEETAH")
    end

    it "should be a string" do
      player = Scrabble::Player.new("Jen")
      player.play("BEAR")
      player.play("CHEETAH")
      player.play("RAT")
      player.play("CAT")
      player.highest_scoring_word.must_be_instance_of(String)
    end
  end

  describe "#highest_word_score" do
    it "should return the highest_scoring_word score" do
      player = Scrabble::Player.new("Jen")
      player.play("BEAR")
      player.play("CHEETAH")
      player.play("RAT")
      player.play("CAT")
      player.highest_word_score.must_equal(65)
    end

    it "should be a fixnum" do
      player = Scrabble::Player.new("Jen")
      player.play("BEAR")
      player.play("CHEETAH")
      player.play("RAT")
      player.play("CAT")
      player.highest_word_score.must_be_instance_of(Fixnum)
    end

  end

end
