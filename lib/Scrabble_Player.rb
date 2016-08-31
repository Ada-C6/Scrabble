require_relative '../scrabble.rb'
require_relative 'scrabble_scoring.rb'

class Scrabble::Player
  attr_reader :name, :plays

  def initialize(name)
    # we want the player to use a string for a name
    raise ArgumentError unless name.class == String

    @name = name
    @plays = []
  end

  # allows the player to plays a word as long as they have not already won
  def play(word)
    if won?
      return false
    else
      @plays << word
      score = Scrabble::Scoring.score(word)
      return score
    end
  end

  # method that returns the word that a player has played with the highest score
  def highest_score_word
    highest_word = Scrabble::Scoring.highest_score_from(@plays)
    return highest_word
  end

  # method that returns the score of a player's highest scoring word
  def highest_word_score
    highest_score = Scrabble::Scoring.score(highest_score_word)
    return highest_score
  end

  # method that checks what the total score is
  def total_score
    score = 0
    @plays.each do |word|
      score += Scrabble::Scoring.score(word)
    end
    return score
  end

  # method that checks if player has 100+ points; if so, they've won
  def won?
    if total_score >= 100
      return true
    else
      return false
    end
  end

end # end of class
