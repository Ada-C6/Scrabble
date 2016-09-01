require_relative 'scoring'
module Scrabble

  class Player
    attr_reader :name
    attr_accessor :plays, :final_score, :scores

    def initialize(name)
      @name = name
      @plays = []
      @scores = []
      @final_score = 0
    end

    def play(word)
      @plays << word

      if won?
        return false
      else
        @scores << Scoring.score(word)
        total_score
        return Scoring.score(word)
      end
    end

    def total_score
      @final_score = @scores.reduce(:+)
      return @final_score
    end

    def won?
     @final_score >= 100
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
    return @scores.max
    end


  end
end
