require_relative 'spec_helper'
require_relative '../player'
require_relative '../tilebag'

describe Scrabble::Player do

  p = Scrabble::Player.new("name")

  describe "initialize" do
    it "should be an instance of Player" do
      p.must_be_instance_of(Scrabble::Player)
    end

    it "should initialize with only one parameter (name)" do
      p.must_respond_to(:name)
    end
  end

  describe "plays" do
    it "should return an Array of the words played by the player" do
      p.tiles = ["c","a","t","b","i","r","d"]
      p.plays = []
      p.play("cat")
      p.play("bird")
      p.plays.must_equal(["CAT", "BIRD"])
    end
  end

  describe "play" do
    it "should add the input word to the plays Array" do
      p.tiles = ["d","o","g","b","i","r","d"]
      p.plays = []
      p.play("dog")
      p.plays.must_equal(["DOG"])
    end

    it "should return false if player has already won" do
        p.total = 101
        p.play("hi").must_equal(false)
    end
    #
    # it "should check if the the word is inculded in the tile bag tell the player
    # he cant use the word and return nil" do
    #   r = Scrabble::Player.new("name")
    #   r.tiles = ["h", "e", "l", "l", "o","c", "w"]
    #   r.play("son").must_equal(nil)
    # end
    # it "should add the word played into the the plays array" do
    #   s = Scrabble::Player.new("name")
    #       s.tiles = ["h", "e", "l", "l", "o","c", "w"]
    #       s.play("cow")
    #       s.plays.must_equal(["COW"])
    # end
    # it "should delete the letters included in the word used from the tile bag " do
    #     r = Scrabble::Player.new("name")
    #     r.tiles = ["h", "e", "l", "l", "o","c", "w"]
    #     r.play("cow")
    #     r.tiles.must_equal(["h", "e", "l", "l"])
    # end

    it "should return word_score if player has not already won" do
      p.tiles = ["h","i"]
      p.total = 0
      p.play("hi").must_equal(5)
    end
  end

  describe "#total_score" do
    it "should return the total score of played words" do
      w = Scrabble::Player.new("name")
      w.tiles = ["c","a","t","b","i","r","d","a","n","d","h","o","m","e"]
      w.plays = []
      w.total = 0
      w.play("cat")
      w.play("birdand")
      w.total_score.must_equal(75)
      w.play("home")
    end
  end

  describe "won?" do
    it "should return true if player has over 100 points" do
      p.total = 101
      p.won?.must_equal(true)
    end

    it "should return false is player does not have over 100 points" do
      p.total = 100
      p.won?.must_equal(false)
    end
  end

  describe "#highest_scoring_word" do
    it "should return the highest scoring played word" do
    @plays = []
    p.plays = ["car", "birdand", "home"]
    p.highest_scoring_word.must_equal("BIRDAND")
    end
  end

   describe "#highest_word_score" do
     it "should return the highst scoring word score" do
       @plays = []
       p.plays = ["car", "birdand", "home"]
       p.highest_word_score.must_equal(61)
     end
   end

   describe "#tiles" do
     it "should have at most seven tiles at a time" do
       p.tiles.length.must_be :<=, 7
     end
   end

   describe "#draw_tiles" do
     it "should fill the tiles array to 7 when there are tiles remaining in the tile bag" do
       q = Scrabble::Player.new("name")
       r = Scrabble::TileBag.new
       q.draw_tiles(r)
       q.tiles.length.must_equal(7)
     end
    end
end
