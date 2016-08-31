require_relative 'spec_helper'
require_relative '../player'

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
  end

  #plays: returns an Array of the words played by the player
  describe "#plays" do
    jane = Scrabble::Player.new("Jane")
    word = "scary"
    it "should return an Array" do
      jane.plays(word).must_be_kind_of(Array)
    end
#play(word): Adds the input word to the plays Array
    it "should add input word to the plays Array" do
      jane.plays(word).must_include("scary")
    end

  end

end


# Returns false if player has already won
# Returns the score of the word
# #total_score: Returns the sum of scores of played words
# #won?: If the player has over 100 points, returns true, otherwise returns false
# #highest_scoring_word: Returns the highest scoring played word
# #highest_word_score: Returns the highest_scoring_word score
