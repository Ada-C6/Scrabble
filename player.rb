require_relative 'scoring'
require_relative 'tilebag'

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

    def draw_tiles(tile_bag)
      until @player_letters.length > 6
        if tile_bag.tiles_remaining > 0
          @player_letters.push(tile_bag.available_letter_array.pop)
        else
          ArgumentError("No tiles left")
        end
      end
      return @player_letters
    end
  end
end
