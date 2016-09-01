require_relative 'spec_helper'
require_relative '../player'
# require_relative '../scoring'

# Create a Scrabble::Player class with a minimum of 11 specs. The only required paramter for instances of the class is the player's name. Instances of the class should repond to the following messages:
describe Scrabble::Player do

  describe "#initialize" do
    jane = Scrabble::Player.new("Jane")

    it "should create an instance of Player with a name parameter" do
      jane.must_be_instance_of(Scrabble::Player)
    end

    #name: returns the value of the @name instance variable
    it "should be able to return value of @name instance variable" do
      jane.name.must_equal("Jane")
    end

    it "should return the sum of scores of played words for that instance of player" do
      jane.play("bottle")
      jane.play("poppin")
      jane.play("salsa")
      jane.total_score.must_equal(8+12+5)
    end
  end

  #plays: returns an Array of the words played by the player
  describe "#plays" do
    jane = Scrabble::Player.new("Jane")
    jane.play("bottle")
    jane.play("poppin")
    jane.play("salsa")
    it "should return an Array" do
      jane.plays.must_be_kind_of(Array)
    end

    it "should return an Array of the words played by the player" do
      jane.plays.must_equal(%w(bottle poppin salsa))
    end
  end
#play(word): Adds the input word to the plays Array

  describe "#play_word" do
    joan = Scrabble::Player.new("Joan")
    joan_wins = Scrabble::Player.new("Joan_wins")
    word = "scary"

    # it "should only let the user play if they have the letters for that word" do
    #   jewel = Scrabble::Player.new("Jewel")
    #   jewel.players_hand = %w(D G T O V E J)
    #   proc { jewel.play("DOG").must_equal(false)}.must_raise(ArgumentError)
    # end

    it "should add input word to the plays Array" do
      joan.play(word)
      joan.plays.must_include("scary")
    end

    it "should return the score of the word played" do
      joan.play(word).must_equal(10)
    end

    it "should return FALSE if player has already won" do
      word_two = "aaaaaaa"
      word_three = "ooooooo"
      joan_wins.play(word_two)
      joan_wins.play(word_three).must_equal(false)
    end
  end

  describe "#letters_in_players_hand?(word)" do
    janis = Scrabble::Player.new("Janis")
    janis.players_hand = %w(D G T O V E J)
    it "should return true if letters in word are all available in players_hand" do
      janis.letters_in_players_hand?("DOG").must_equal(true)
    end

    it "should return false if letters in word are not in players_hand" do
      janis.letters_in_players_hand?("CAT").must_equal(false)
    end


############### TRYING TO MAKE SURE THE CORRECT LETTERS ARE REMOVED FROM HAND WHEN ACCURATE WORD IS PLAYED. CONSIDERED .length
    # it "should remove letters from players hand if the is possible for word to be played" do
    #   janis.letters_in_players_hand?("DOG")
    #   janis.players_hand.must_match(%w(T V E J))
    # end
  end

  describe "#won?" do
    jenny = Scrabble::Player.new("Jenny")
    jenny.play("aaaaaaa")
    jenny.play("ooooooo")
    it "should return TRUE if player has over 100 pts, otherwise FALSE" do
      jenny.won?.must_equal(true)
    end
  end

  describe "#highest_scoring_word" do
    jojo = Scrabble::Player.new("Jojo")
    jojo.play("hi")
    jojo.play("develop")
    it "should return the highest scoring played word" do
      jojo.highest_scoring_word.must_equal("develop")
    end
  end

  describe "#highest_word_score" do
    jojo = Scrabble::Player.new("Jojo")
    jojo.play("hi")
    jojo.play("develop")
    it "should return the score of the highest scoring word" do
      jojo.highest_word_score.must_equal(63)
    end
  end

  describe "#collection of letters per player (max 7)" do
    jill = Scrabble::Player.new("Jill")

    it "should return an array" do
      jill.tiles.must_be_instance_of(Array)
    end

    it "should return an array of 7 letters or less" do
      jill.tiles.length.must_be( :<=, 7)
    end
  end

  describe "#draw_tiles" do
    jessie = Scrabble::Player.new("jessie")
    it "should return an array of 7 letters" do
        jessie.draw_tiles.length.must_be( :<=, 7)
    end
  end

end


#tiles a collection of letters that the player can play (max 7)
#draw_tiles(tile_bag) fills tiles array until it has 7 letters from the given tile bag


# Returns false if player has already won
# Returns the score of the word
# #total_score: Returns the sum of scores of played words
# #won?: If the player has over 100 points, returns true, otherwise returns false
# #highest_scoring_word: Returns the highest scoring played word
# #highest_word_score: Returns the highest_scoring_word score
