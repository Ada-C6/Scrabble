require_relative 'spec_helper'
require_relative '../player'

describe Scrabble::Player do

    describe "#initialize" do
        jane = Scrabble::Player.new("Jane")

        it "should create an instance of Player" do
            jane.must_be_instance_of(Scrabble::Player)
        end

        it "should be able to return player's name" do
            jane.must_respond_to(:name)
        end

        it "must be able to return player's plays" do
            jane.must_respond_to(:plays)
        end
    end

    describe "#play(word)" do

        it "should add player's words to @plays array" do
            john = Scrabble::Player.new("John")
            played_words = ["hex", "bats", "kittys"]

            played_words.each do |word|
                john.play(word)
            end
            john.plays.length.must_equal(3)
        end

        it "should return score of word" do
            john = Scrabble::Player.new("John")
            john.play("fox").must_equal(13)
        end

        it "should return false if player has won" do
            john = Scrabble::Player.new("John")
            winning_array = ["staring", "zzzzzx"]

            winning_array.each do |word|
                john.play(word)
            end

            john.play("fox").must_equal(false)
        end
    end

    describe "#total_score" do

        it "should return sum of all words' scores" do
            john = Scrabble::Player.new("John")
            animals = ["kittys", "fox", "cat", "dog"]

            animals.each do |word|
                john.play(word)
            end
            john.total_score.must_equal(36)
        end

        it "should return 0 if no words have been played" do
          john = Scrabble::Player.new("John")
          john.total_score.must_equal(0)

        end
    end

    describe "#won?" do

        it "should return true if score is > 100" do
            john = Scrabble::Player.new("John")
            winning_array = ["staring", "zzzzzx"]

            winning_array.each do |word|
                john.play(word)
            end

            john.won?.must_equal(true)
        end

        it "should return false if empty" do
            john = Scrabble::Player.new("John")
            john.won?.must_equal(false)
        end

        it "should return false if not winning" do
            john = Scrabble::Player.new("John")
            losing_array = ["cat", "dog"]

            losing_array.each do |word|
                john.play(word)
            end
            john.won?.must_equal(false)
        end
    end

    describe "#highest_scoring_word" do

        it "should return the highest scoring word played" do
            john = Scrabble::Player.new("John")
            animals = ["kittys", "fox", "cat", "dog"] # => "fox"

            animals.each do |word|
                john.play(word)
            end

            john.highest_scoring_word.must_equal("fox")
        end

        it "should return 'NO WORDS PLAYED' if no words have been played" do
            john = Scrabble::Player.new("John")
            john.highest_scoring_word.must_equal("NO WORDS PLAYED")
        end

    end

    describe "#highest_word_score" do
        it "must return the numerical score of highest_scoring_word" do
            john = Scrabble::Player.new("John")
            animals = ["kittys", "fox", "cat", "dog"]
            animals.each do |word|
                john.play(word)
            end
            john.highest_word_score.must_equal(13)
        end

        it "should return 0 if no words in array" do
            john = Scrabble::Player.new("John")
            john.highest_word_score.must_equal(0)
        end
    end

end
