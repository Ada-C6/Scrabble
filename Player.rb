require_relative 'scoring'

module Scrabble
  class Player
    attr_accessor :name, :score_array
    attr_reader :word_array

    def initialize(name)
      @name = name
      @word_array = []
      @score_array = []
    end

    def plays
      return @word_array
    end

    def play(word)
      raise ArgumentError.new("invalid input type") unless word.is_a?(String)
      @word_array << word
      score = Scrabble::Scoring.score(word)
      @score_array << score
      return score
    end

    def total_score
      @score_array.reduce(:+)
    end

  end
end
