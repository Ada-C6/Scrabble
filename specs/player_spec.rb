# test for Player class

require_relative '../player'
require_relative '../tile_bag'
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

        it "should have a tiles property" do
            new_player.must_respond_to(:tiles)
        end
    end

    describe "#play(word)" do
        it "must raise an error if a non-string parameter input is passed into the method (play(word))" do
            proc {Scrabble::Player.new("Jasper").play(123)}.must_raise(ArgumentError)
        end

        it "@plays array should be different after calling the play(word) method" do
            player_1 = Scrabble::Player.new("Yoyo")
            player_1.tiles = %w(S H O W E R S)
            original_array = player_1.plays.clone
            player_1.play("SHOWERS")
            player_1.plays.wont_equal(original_array)
        end

        it "the word passed in to play(word) method should be the last item in @plays array" do
            player_2 = Scrabble::Player.new("Yaya")
            player_2.tiles = %w(S H O W E R S)
            player_2.play("SHOWERS")
            player_2.plays.last.must_equal("SHOWERS")
        end

        it "should return the score of the string input if not won" do
            another_player = Scrabble::Player.new("Kelly")
            another_player.tiles = %w(L I O N E S S)
            another_player.play("lioness").must_equal(57)
        end

        it "should return false if player already won" do
            new_player.won = true
            new_player.tiles = %w(L I O N E S S)
            new_player.play("lioness").must_equal(false)
        end

        it "should raise an error when the played word is NOT in the @tile array" do
            bad_player = Scrabble::Player.new("Maleficient")
            bad_player.tiles = %w(A B C D E F G)
            bad_player.play('XYZ').must_equal(nil)
        end

        it "should return an updated @tiles array after play(word) is called" do
            another_bad_player = Scrabble::Player.new("Mustafa")
            another_bad_player.tiles = %w(A B C D E F G)
            copy_original_tiles = another_bad_player.tiles.clone
            another_bad_player.play('ABC')
            another_bad_player.tiles.wont_equal(copy_original_tiles)
        end

        it "should return the original @tiles array if the play(word) is called with letters which don't exist in the @tiles array" do
            last_player = Scrabble::Player.new("Pikachu")
            last_player.tiles = %w(P O K E M O N S)
            copy_last_player_tiles = last_player.tiles.clone
            last_player.play('POKER')
            last_player.tiles.must_equal(copy_last_player_tiles)
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

    describe "#highest_scoring_word" do
        it "should return the highest scoring word from the @plays instance variable" do
            score_player = Scrabble::Player.new("Jeremy")
            score_player.plays = ['CAT', 'QQQQQJ', 'AAAAAAG']
            score_player.highest_scoring_word.must_equal('AAAAAAG')
        end

        it "should return an argument error if no word has been played" do
            # i.e. @plays array is empty
            nil_player = Scrabble::Player.new("Jeremy")
            nil_player.highest_scoring_word.must_equal(nil)
            # proc {nil_player.highest_scoring_word}.must_raise(ArgumentError)
            # @todo decide if we want to handle error or throw ArgumentError
            # STUCK AT LINE 67 OF SCORING.RB
        end
    end # highest_scoring_word

    describe "#highest_word_score" do
        it "should return the highest_scoring_word score" do
            more_player = Scrabble::Player.new("Dianne")
            more_player.plays = ['CAT', 'COW', 'LIONESS']
            more_player.highest_word_score.must_equal(57)
        end
    end

    describe "#draw_tiles(tile_bag)" do
        it "should raise an error if the parameter input is not an object of the TileBag class" do
            proc { new_player.draw_tiles(123) }.must_raise(ArgumentError)
        end

        it "ensure the @tiles array has 7 letters after drawing tiles" do
            yeni = Scrabble::Player.new("Yeni")
            yenis_tile_bag = Scrabble::TileBag.new
            yeni.draw_tiles(yenis_tile_bag)
            yeni.tiles.length.must_equal(7)
        end

        it "should mutate the original @tiles array after drawing tiles" do
            kelly = Scrabble::Player.new("Kelly")
            kellys_tile_bag = Scrabble::TileBag.new
            original_tiles = kelly.tiles.clone
            kelly.draw_tiles(kellys_tile_bag)
            kelly.tiles.wont_equal(original_tiles)
        end
    end
end
