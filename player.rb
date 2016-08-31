require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :plays
    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      if won?
          return false
      else
          @plays << word
          return Scrabble::Scoring.score(word)
      end
    end

    def total_score
      score_sum = 0
      @plays.each do |word|
        score = Scrabble::Scoring.score(word)
        score_sum += score
      end
      return score_sum
    end

    def won?
        total_score > 100
    end

    def highest_scoring_word
        if @plays.empty?
            return "NO WORDS PLAYED"
        else
            highest = Scrabble::Scoring.highest_score_from(@plays)
            return highest
        end
    end

    def highest_word_score
        if @plays.empty?
            return 0
        else
            highest_score = Scrabble::Scoring.score(highest_scoring_word)
            return highest_score
        end
    end
  end
end
