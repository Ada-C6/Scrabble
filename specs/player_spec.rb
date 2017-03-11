require_relative 'spec_helper'
require_relative '../player'
require_relative '../scoring'
require_relative '../tilebag'

describe Scrabble::Player do

  # TRYING TO REFACTOR, if we had more time we would finish this. We had trouble figuring out and implementing the refactoring.

  # before do
  #   @player_ip = Scrabble::Player.new("Jen")
  #   @player_b = Scrabble::Player.new("Dan")
  #   @player_w = Scrabble::Player.new("Maddie")
  # end
  #
  # after do
  #   @player_ip.destroy!
  #   @player_b.destroy!
  #   @player_w.destroy!
  # end

  describe "#initialize" do
    it "can initialize a new instance of Player" do
      player = Scrabble::Player.new("Jen")
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
    # If we had time, we would have added a test to give an error is the user didn't enter a word. 

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

    it "should be a Fixnum" do
      player = Scrabble::Player.new("Jen")
      player.play("BEAR")
      player.play("CHEETAH")
      player.play("RAT")
      player.play("CAT")
      player.total_score.must_be_instance_of(Fixnum)
    end
  end

  describe "#won?" do
    it "should display if the person has won the game" do
      player = Scrabble::Player.new("Jen")
      player.play("BEAR")
      player.play("CHEETAH")
      player.play("RAT")
      player.play("CAT")
      player.play("QQQQQJ")
      if player.total_score >= 100
        player.won?.must_equal(true)
      end
    end

    it "should display if the person has won the game or not" do
      player = Scrabble::Player.new("Jen")
      player.play("BEAR")
      player.play("CHEETAH")
      player.play("RAT")
      player.play("CAT")
      if player.total_score < 100
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

    it "should be a String" do
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

    it "should be a Fixnum" do
      player = Scrabble::Player.new("Jen")
      player.play("BEAR")
      player.play("CHEETAH")
      player.play("RAT")
      player.play("CAT")
      player.highest_word_score.must_be_instance_of(Fixnum)
    end
  end

  describe "#tiles" do
    it "should be a collection of letters the player can play (up to 7)" do
      player = Scrabble::Player.new("Jen")
      player.tiles.must_be :<=, 7
    end
  end

  describe "#draw_tiles(tile_bag)" do
    it "should fill player_tiles array until it has 7 letters from the tile bag" do
      player = Scrabble::Player.new("Jen")
      bag_o_tiles = Scrabble::TileBag.new
      bag_o_tiles.fill_bag
      player.draw_tiles(bag_o_tiles).length.must_equal(7)
    end

    it "should not add nil values to array when no tiles remain" do
      player = Scrabble::Player.new("Jen")
      bag_o_tiles = Scrabble::TileBag.new
      bag_o_tiles.fill_bag
      bag_o_tiles.draw_tiles(98)
      proc { player.draw_tiles(bag_o_tiles) }.must_raise("No tiles left")
    end
  end
end
