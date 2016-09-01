require_relative 'Scoring'

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
      if won? == true
        puts "You won!"
        return false
      else
        return score
      end
    end

    def total_score
      @score_array.reduce(:+)
    end

    def won?
      if total_score >= 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from_array(@word_array)
    end

    def highest_word_score
      word = highest_scoring_word
      return Scrabble::Scoring.score(word)
    end
  end
end
