require_relative 'scoring'
require_relative 'tilebag'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :players_hand

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @players_hand = []
      @tile_bag = Scrabble::TileBag.new
    end

    def play(word)
      @plays << word
      # if Returns false if player has already won

      word_score = Scrabble::Scoring.score (word)
      @total_score += word_score
      # Returns the score of the word
      if won?
        return false
      else
        return word_score
      end
    end

    def won?
      @total_score > 100
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      highest_word = highest_scoring_word
      Scrabble::Scoring.score(highest_word)
    end

    def tiles
      @players_hand = []
    end

    def players_hand_incomplete?
      @players_hand.length < 7
    end

    def draw_tiles
      if players_hand_incomplete?
        number_of_tiles_to_draw = (7 - @players_hand.length)
        new_tiles = @tile_bag.draw_tiles(number_of_tiles_to_draw)
        @players_hand += new_tiles
      end
      return @players_hand
    end
  end
end
