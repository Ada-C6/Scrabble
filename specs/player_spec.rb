require_relative "../lib/player.rb"
require_relative 'spec_helper'
module Scrabble

  describe Player do
    describe "#initialize" do
      let(:player) { Player.new(:name) }

      it "can create an instance of Player" do
        player.must_be_instance_of(Player)
      end

      it "must respond to name attribute" do
        player.must_respond_to(:name)
      end

    end

    describe "#plays" do
      let(:player) { Player.new(:name) }
      it "should return an array" do
        player.plays.must_be_instance_of(Array)
      end

      it "should return an array of words/string" do
        player.plays.each{|word| word.must_be_instance_of(String)}
      end
    end

    describe "#play(word)" do
      let(:player) { Player.new("Alma") }

      it "should raise an error if word is not provided at all" do
        proc{player.play('')}.must_raise(ArgumentError)

      end

      it "should append words to @words_played" do
        player.play("dog")
        player.play("foot")
        "dog".must_equal(player.plays.first)
        "foot".must_equal(player.plays.last)
      end

      it "method returns the score of a word from Scoring" do
        player.play("imposter").must_equal(12)
      end
    end #play(word)

    describe "#total_score" do
      let(:player) { Player.new("Alma") }

      it "should check total score from plays array" do
        player.play("dog") #returns score = 5
        player.play("foot") #returns => 7
        player.play("coffee") #returns => 14
        player.total_score.must_equal(26)
      end

    end #end describe total score

    describe "#won?" do
      let(:player) { Player.new("Alma") }

      it "should return true if total player score is greater than 100" do
        player.play("pizzazz")
        player.play("coffee")
        player.total_score #will return sum
        player.won?.must_equal(true)
      end
    end #end won? method

    describe "#highest_scoring_word" do
      let(:player) { Player.new("Alma") }

      it "should return the highest scoring word player played" do
        player.play("pizzazz")
        player.play("coffee")
        player.highest_scoring_word.must_equal("pizzazz")
      end
    end #end highest scoring word method

    describe "#highest_word_score" do
      let(:player) { Player.new("Alma") }

      it "should return the score of the highest scoring word player played" do
        player.play("pizzazz")
        player.play("coffee")
        player.highest_word_score.must_equal(95)
      end
    end

    describe "#tiles" do
      let(:player) { Player.new("Alma") }

      it "should return an array of letters" do
        player.tiles.must_be_instance_of(Array)
      end

      it "should limit the tray to a max of 7" do
        player.tiles.length.must_be(:<=, 7)
      end
    end

    describe "#draw_tiles(tile_bag)" do
      let(:player) { Player.new("Alma") }
      it "should draw tiles until tray has 7 tiles" do

        player.tile_tray.length.must_equal(7)
      end
    end
  end




  #
  # it "should not allow player to draw more tiles than tray_max" do
  #
  # end
  # player need to care about their own tray



end
