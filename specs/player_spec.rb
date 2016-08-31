require_relative 'spec_helper'
require_relative '../player'

describe Scrabble::Player do
  describe "#initialize" do
    it "can initialize a new instance of Player" do
      player = Scrabble::Player.new(name)
      player.must_be_instance_of(Scrabble::Player)
    end
  end

  describe "#plays" do
    it "should have an array of played words" do
      player = Scrabble::Player.new(name)
      player.plays.must_equal(["BEAR", "CHEETAH", "RAT", "CAT"])
    end
  end

  describe "#play(word)" do
    it "should put the word into the plays array" do
      player = Scrabble::Player.new(name)
      player.plays.must_include("BEAR")
    end

    # it "should return false if player has already won game" do
    #   player = Scrabble::Player.new(name)
    #
    # end

    it "should return the score of the word" do
      Scrabble::Scoring.new
      Scrabble::Scoring.score("BEAR").must_equal(6)
    end

    describe "#total_score" do
      it "should return the sum of the scores of played words" do
        Scrabble::Player.new(name)
        ["BEAR", "CHEETAH", "RAT", "CAT"].must_equal(77)
      end
    end

    describe "#won?" do
      it "should display if the person has won the game" do
        player = Scrabble::Player.new(name)
        if player.total_score >= 100
          player.won?.must_equal(true)
        end
      end

      it "should display if the person has not won the game yet" do
        player = Scrabble::Player.new(name)
        if player.total_score < 100
          player.won?.must_equal(false)
        end
      end

      describe "#highest_scoring_word" do
        it "return the highest scoring played word by a player" do
          Scrabble::Scoring.new
          # can we use the Scoring class' highest_score_from method?
          player = Scrabble::Player.new(name)
          player.plays.highest_scoring_word.must_equal("CHEETAH")
        end
      end

      describe "#highest_word_score" do
        it "should return the highest_scoring_word score" do
          player = Scrabble::Player.new(name)
          player.plays.highest_word_score.must_equal(63)
        end
      end
    end

  end
end
