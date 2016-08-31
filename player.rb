require_relative 'scoring'
module Scrabble
  class Player
    attr_reader :name
    attr_accessor :plays

    def initialize(name)
      @name = name
      @plays = []
      @total = 0
    end

    def play(word)
      @plays << word
      @total += Scrabble::Scoring.score(word)
    end

    def plays
      return @plays
    end

    def total_score
     return @total
    end

  end
end
