require_relative '../scrabble.rb'
require_relative 'scrabble_scoring.rb'
class Scrabble::Player
  attr_reader :name, :plays

  def initialize(name)
    @name = name
    @plays = []
  end

  def play(word)
    @plays << word
    score = Scrabble::Scoring.score(word)
    return score
  end

  def highest_score_word
    highest_word = Scrabble::Scoring.highest_score_from(@plays)
    return highest_word
  end

  def highest_word_score
    highest_score = Scrabble::Scoring.score(highest_score_word)
    return highest_score
  end

  def total_score
    score = 0
    @plays.each do |word|
      score += Scrabble::Scoring.score(word)
    end
    return score
  end
  def won?
    if total_score >= 100
      return true
    else
      return false
    end
  end

end # end of class
