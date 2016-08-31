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

    end


  end








end
