require_relative "../module"
require_relative "../lib/Scoring"

class Scrabble::Player

  #attr_accessor :word, :total
  def initialize(name)
    @name = name
    @word_score = 0
    @total_score = 0

  end

  def plays
    # returns Array of words played by player: # words_by_player = []
  end

  def play(word)
    #play(word): Adds the input word to the plays Array:words_by_player
    # Returns false if player has already won
    # Returns the score of the word: @word_score
    #
  end

  def total_score
    # Returns the sum of scores of played words: @total_score

  end

  def won?

    # If the player has over 100 points, returns true, otherwise returns false: if statement, total_score >= 100 return true else return false

  end

  def highest_scoring_word
    # Returns the highest scoring played word
    # include?? highest_score_from
  end

  def highest_word_score
    # Returns the highest_scoring_word score
    # include?? highest_score_from but also return max_scoring_word somehow??
  end

end
