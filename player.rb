require_relative 'scoring'
module Scrabble

  class Player
    attr_reader :name
    attr_accessor :plays

    def initialize(name)
      @name = name
      @plays = []
      @scores = []
    end

    def play(word)
      @plays << word

      if Scoring.score(word) >= 100
        return false
      else
        @scores << Scoring.score(word)
        return Scoring.score(word)
      end
    end

    def total_score
      return @scores.reduce(:+)
    end

    def won?
      total_score > 100
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
    return @scores.max
    end




  end
end
