require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end

    def play(word)
      @plays << word
      # if Returns false if player has already won

      word_score = Scrabble::Scoring.score (word)
      @total_score += word_score
      # Returns the score of the word
      if won?
        return false
      else
        return word_score
      end
    end

    def won?
      @total_score > 100
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      highest_word = highest_scoring_word
      Scrabble::Scoring.score(highest_word)
    end 
  end
end
