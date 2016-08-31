# test for Player class

require_relative '../player'
require_relative 'spec_helper'



describe Scrabble::Player do
    new_player = Scrabble::Player.new("Jasper")

    describe "#initialize" do
        it "must be an instance of the Player class" do
            Scrabble::Player.new("Jasper").must_be_instance_of(Scrabble::Player)
        end

        it "should have the same value that we set" do
            new_player.name.must_equal("Jasper")
        end

        it "should raise an error if a non-string parameter input is passed in" do
            proc {Scrabble::Player.new(123)}.must_raise(ArgumentError)
        end
    end

    describe "#play(word)" do
        it "must raise an error if a non-string parameter input is passed into the method (play(word))" do
            proc {Scrabble::Player.new("Jasper").play(123)}.must_raise(ArgumentError)
        end

        it "@plays array should be different after calling the play(word) method" do
            original_array = new_player.plays.clone
            new_player.play("SHOWERS")
            new_player.plays.wont_equal(original_array)
        end

        it "the word passed in to play(word) method should be the last item in @plays array" do
            new_player.play("SHOWERS")
            new_player.plays.last.must_equal("SHOWERS")
        end

        it "should return the score of the string input if not won" do
            another_player = Scrabble::Player.new("Kelly")
            another_player.play("lioness").must_equal(57)
        end

        it "should return false if player already won" do
            new_player.won = true
            new_player.play("lioness").must_equal(false)
        end
    end # play(word)

    describe "#total_score" do
        it "returns the sum of scores of played words" do
            new_player.plays = ['CAT', 'DOG', 'COW']
            new_player.total_score.must_equal(18)
        end
    end

    describe "#won?" do
        it "If the player has over 100 points, returns true" do
            winner = Scrabble::Player.new("Karen")
            winner.total_score = 150
            winner.won?.must_equal(true)
        end

        it "If the player has 100 points or less, returns false" do
            loser = Scrabble::Player.new("Samba")
            loser.total_score = 80
            loser.won?.must_equal(false)
        end
    end

    # didn't finish the syntax :D
    describe "#highest_scoring_word" do
        it "should return nil if we pass in an empty array" do
            skip
            new_player.highest_scoring_word([]).must_equal(nil)
        end

        it "should return the highest scoring word if we pass in @plays array" do
            skip
            # new_player = Scrabble::Player.new("Jasper")
            new_player.highest_scoring_word(@plays).must_equal()#highest scoring word)
        end

        it "should return the highest scoring word if we pass in a random array" do
            skip
            # new_player = Scrabble::Player.new("Jasper")
            new_player.highest_scoring_word(['CAT', 'QQQQJ', 'QQQQBK']).must_equal('QQQQJ')
        end
    end # highst_scoring_word
end
