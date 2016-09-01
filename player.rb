require_relative 'scoring'

module Scrabble
  class Player
    attr_accessor :name, :play_array, :word

    def initialize(name)
      @name = name
      @play_array = []
      @word = word
    end

    def plays
      return @play_array
    end

    def play(word)

      @play_array << word
      if won?
        return false
      else
        return Scrabble::Scoring.score(word)
      end
    end

    def total_score
      sum = 0
      @play_array.each do |word|
        sum += Scrabble::Scoring.score(word)
      end
      return sum
    end

    def won?
    end

    def highest_scoring_word
    end

    def highest_word_score
    end

  end
end

jm = Scrabble::Player.new("JM")
puts jm.play("BEAR")
puts jm.play("CHEETAH")
puts jm.play("RAT")
puts jm.play("CAT")
puts jm.plays
puts jm.total_score
