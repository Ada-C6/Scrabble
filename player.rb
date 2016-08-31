require_relative 'scoring'
module Scrabble
  class Player
    attr_reader :name
    attr_accessor :plays, :total

    def initialize(name)
      @name = name
      @plays = []
      @total = 0
    end

    def play(word)
      @plays << word
      word_score = Scrabble::Scoring.score(word)
      @total += word_score
      if won?
        return false
      else
        return word_score
      end
    end

    def plays
      return @plays
    end

    def total_score
     return @total
    end

    def won?
      if @total > 100
        return true
      else
        return false
      end
    end

  end
end
