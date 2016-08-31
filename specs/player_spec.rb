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

        it "has a total score" do
            player_test.must_respond_to(:total_score)
        end
    end

    describe "#won?" do
        it "returns false if total score is less than 100" do
            player_test.won?.must_equal(false)
        end

        it "returns false if total score is 100" do
            player_test.play("penguin")
            player_test.play("check")
            player_test.play("week")
            player_test.play("it")
            player_test.play("hook")

            player_test.won?.must_equal(false)

        end

        it "returns true if total score is greater than 100" do
          player_test.play("penguin")
          player_test.play("sunrise")
          player_test.won?.must_equal(true)

        end
    end

    describe "#play(word)" do
        it "returns the score of a word before winning" do
            player_test.play("check").must_equal(16)
        end

        it "must take one argument" do
          proc {player_test.play()}.must_raise(ArgumentError)
        end

        it "cannot take nil" do
          proc {player_test.play(nil)}.must_raise(NoMethodError)
        end

        it "will change the plays array" do
            player_test.play("check")
            player_test.plays.must_equal(["check"])
        end

        it "will return false if score is over 100" do

          player_test.play("penguin")
          player_test.play("sunrise")
          player_test.play("week").must_equal(false)

        end
    end

    describe "#highest_scoring_word" do
      it "returns the highest scoring word" do

        player_test.play("penguin")
        player_test.play("it")
        player_test.play("week")
        player_test.highest_scoring_word.must_equal("penguin")
      end

    end

    describe "#highest_word_score" do
      it "returns the highest scoring word's score" do

        player_test.play("penguin")
        player_test.play("it")
        player_test.play("week")
        player_test.highest_word_score.must_equal(60)
      end

    end
end
