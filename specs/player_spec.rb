require_relative 'spec_helper'
require_relative '../player'

# Create a Scrabble::Player class with a minimum of 11 specs. The only required paramter for instances of the class is the player's name. Instances of the class should repond to the following messages:
describe Scrabble::Player do
  describe "#initialize" do
    it "should only initialize when passed a player name" do
      Scrabble::Player.new("Jane") #WIP
    end
    # use must_be_instance_of for something
  end

end

#
# #name: returns the value of the @name instance variable
# #plays: returns an Array of the words played by the player
# #play(word): Adds the input word to the plays Array
# Returns false if player has already won
# Returns the score of the word
# #total_score: Returns the sum of scores of played words
# #won?: If the player has over 100 points, returns true, otherwise returns false
# #highest_scoring_word: Returns the highest scoring played word
# #highest_word_score: Returns the highest_scoring_word score
