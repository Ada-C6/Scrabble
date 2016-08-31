require_relative 'spec_helper'
require_relative '../player'

describe Scrabble::Player do
    let(:player_test) {Scrabble::Player.new("InuYasha")}
    describe "#initialize" do
        it "can create a new instance of Player" do
            player_test.must_be_instance_of(Scrabble::Player)
        end

        it "has a name" do
            player_test.name.must_equal("InuYasha")
        end

        it "has an array containing words played" do
            player_test.must_respond_to(:plays)
        end
    end

    describe "#won?" do
        it "returns true if total score is greater than 100" do
            player_test.won?.must_equal(false)
        end
    end

    describe "#play(word)" do
        it "returns the score of a word before winning" do
            player_test.play("check").must_equal(16)
        end

        it "will change the plays array" do
            player_test.play("check")
            player_test.plays.must_equal(["check"])
        end
    end
end
