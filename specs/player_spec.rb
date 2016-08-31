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
    test_array = ["hex", "bats", "kittys"]
    winning_array = ["staring", "zzzzzx"]

    it "should add player's words to @plays array" do
      john = Scrabble::Player.new("John")
      test_array.each do |word|
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
        winning_array.each do |word|
            john.play(word)
        end

        john.play("fox").must_equal(false)
    end
  end

  describe "#total_score" do
    other_test = ["kittys", "fox", "cat", "dog"]
    it "should return sum of all words' scores" do
      john = Scrabble::Player.new("John")
      other_test.each do |word|
        john.play(word)
      end
      john.total_score.must_equal(36)
    end
  end

  describe "#won?" do
      winning_array = ["staring", "zzzzzx"]

    it "should return true if score is > 100" do
        john = Scrabble::Player.new("John")

        winning_array.each do |word|
            john.play(word)
        end

        john.won?.must_equal(true)
    end
  end

  describe "#highest_scoring_word" do
    other_test = ["kittys", "fox", "cat", "dog"] # => "fox"

    it "should return the highest scoring word played" do
        john = Scrabble::Player.new("John")
        other_test.each do |word|
            john.play(word)
        end

        john.highest_scoring_word.must_equal("fox")
    end

  end

end
