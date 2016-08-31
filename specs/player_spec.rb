require_relative 'spec_helper'
require_relative '../Player.rb'

describe Scrabble::Player do
  describe "#initialize" do

      it "should create a new instance of Player" do
        Scrabble::Player.new("name").must_be_instance_of(Scrabble::Player)
      end

      it "should have a name property" do
        name = "Judy"
        s = Scrabble::Player.new(name)
        s.must_respond_to(:name)
      end

      it "should match the name passed in" do
        name = "Judy"
        s = Scrabble::Player.new(name)
        s.name.must_equal(name)
      end

      it "should initialize with an empty word_array" do
        s = Scrabble::Player.new("Judy")
        s.word_array.length.must_equal(0)
      end
  end

  describe "#plays" do
    it "should return an array" do
      Scrabble::Player.new("name").plays.must_be_kind_of Array
    end
  end

  describe "#play" do
    it "should take a String as a parameter" do
      proc { Scrabble::Player.new("name").play(1) }.must_raise(ArgumentError)
    end

    it "should return a Fixnum or false" do
      Scrabble::Player.new("name").play("word").must_be_kind_of(Fixnum || false)
    end

    it "should increase word_array by amount of words played" do
      s = Scrabble::Player.new("Judy")

      s.play("lksjglksdfj")
      s.word_array.length.must_equal(1)
      s.play("lksjglksdfj")
      s.word_array.length.must_equal(2)
    end

  end

  describe "#total_score" do
    it "should return a number" do
      m = Scrabble::Player.new("Marcus")
      m.play("anyword")
      m.total_score.must_be_kind_of Fixnum
    end
  end
end
