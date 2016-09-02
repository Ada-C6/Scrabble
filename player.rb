require_relative 'scoring'

module Scrabble
  class Player
    attr_accessor :name, :play_array, :word, :player_letters

    def initialize(name)
      @name = name
      @play_array = []
      @word = word
      @player_letters = []
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
      if total_score >= 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@play_array)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end

    def tiles
      return @player_letters.length
    end

  end
end

jm = Scrabble::Player.new("JM")
puts jm.player_letters.class

# Program output verification:
#
# jm = Scrabble::Player.new("JM")
# puts jm.play("BEAR")
# puts jm.play("CHEETAH")
# puts jm.play("RAT")
# puts jm.play("CAT")
# puts jm.plays
# puts jm.total_score
# puts jm.highest_word_score
