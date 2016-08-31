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
        #@todo START HERE NOWHERE ELSE
      end

    end




  end








end
