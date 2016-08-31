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

      it "should append word to @words_played" do
        player.play("dog")
        "dog".must_equal(player.plays.last)
      end
      #
      # it "method returns the score of a word from Scoring" do
      #   player.play("imposter").must_equal(12)
      # end

      #it "method returns false if winner is true" do
      #  player.play("imposter") == false
      #end

    end #ends play(word)




  end








end
