require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :plays
    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      @plays << word
      return Scrabble::Scoring.score(word)
    end

    def total_score

    end
  end
end
