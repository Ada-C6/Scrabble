require_relative 'spec_helper'
require_relative '../player'

describe Scrabble::Player do
  describe "#initialize" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "can create a new instance of Player" do
      player.must_be_instance_of(Scrabble::Player)
    end

    it "should have a name property" do
      player.must_respond_to(:name)
    end

    it "should raise an ArgumentError if input is not String" do
      proc { Scrabble::Player.new(5) }.must_raise(ArgumentError)
    end

    it "should raise an ArgumentError if input is an empty string" do
      proc { Scrabble::Player.new("") }.must_raise(ArgumentError)
    end

    it "should return value of @name" do
      player.name.must_equal("Foot Foot")
    end
  end

  describe "#plays" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "should return an Array" do
      player.plays.must_be_kind_of(Array)
    end

    it "should return an Array of words played by the player" do
      player.plays.must_equal(player.words_played)
    end
  end

  describe "#play" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "the words_played array should include the input value" do
      player.play("fuzzy")
      player.words_played.must_include("fuzzy")
    end

    it "should return false if player has won" do
      player.play("zzzzzzz").must_equal(false)
    end

    it "should return a Fixnum" do
      player.play("fuzzy").must_be_kind_of(Fixnum)
    end
  end

  describe "#total score" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "should return a Fixnum" do
      player.play("foot")
      player.total_score.must_be_kind_of(Fixnum)
    end

    it "should be total score of words played array" do
      player.play("cat")
      player.play("dog")
      player.play("bee")
      player.total_score.must_equal(15)
    end
  end

  describe "#won?" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "should return a true" do
      player.play("zzzzzzz")
      player.won?.must_equal(true)
    end

    it "should return a false" do
      player.play("bah")
      player.won?.must_equal(false)
    end
  end

  describe "#highest_scoring_word" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "should raise an ArgumentError if no words have been played" do
      proc { player.highest_scoring_word }.must_raise(ArgumentError)
    end


    it "should return a string" do
      player.play("goat")
      player.play("think")
      player.play("chair")
      player.highest_scoring_word.must_be_kind_of(String)
    end

    it "should return a string of the highest scoring word" do
      player.play("goat")
      player.play("think")
      player.play("chair")
      player.highest_scoring_word.must_equal("think")
    end
  end

  describe "#highest_word_score" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "should raise an ArgumentError if no words have been played" do
      proc { player.highest_word_score }.must_raise(ArgumentError)
    end

    it "should return a Fixnum" do
      player.play("goat")
      player.play("think")
      player.play("chair")
      player.highest_word_score.must_be_kind_of(Fixnum)
    end

    it "should return the score of the highest word" do
      player.play("goat")
      player.play("think")
      player.play("chair")
      player.highest_word_score.must_equal(12)
    end
  end

  describe "#tiles" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "should return an array" do
      player.tiles.must_be_kind_of(Array)
    end
  end

  describe "#draw_player_tiles" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "should return an array" do
      player.draw_player_tiles(Scrabble::Tilebag.new).must_be_kind_of(Array)
    end
  end

  describe "#delete_played_tiles" do
    let(:player) { Scrabble::Player.new("Foot Foot") }
    # let(:example_tilebag) { Scrabble::Tilebag.new }

    it "should return an array" do
      player.delete_played_tiles.must_be_kind_of(Array)
    end

    it "should delete played tiles from tiles_in_hand" do
      #figure out how to get tiles in hand (force code tiles in hand)
    end
  end
end
