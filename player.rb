require_relative 'scoring'
require_relative 'tilebag'
module Scrabble

  class Player
    attr_reader :name
    attr_accessor :plays, :final_score, :scores, :player_tiles

    def initialize(name)
      @name = name
      @plays = []
      @scores = []
      @player_tiles = []
      @tilebag_instance = Scrabble::TileBag.new

      @final_score = 0
    end

    def play(word)
      @plays << word

      if won?
        return false
      else
        @scores << Scoring.score(word)
        total_score
        return Scoring.score(word)
      end
    end

    def total_score
      @final_score = @scores.reduce(:+)
      return @final_score
    end

    def won?
     @final_score >= 100
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
    return @scores.max
    end

#we are working on tiles and draw_tiles but this is not completely done
    def draw_tiles(num)
      this_tile = @draw_tiles.draw_tiles(num)
      @player_tiles.concat(this_tile)
      if @player_tiles.length > 7
        raise ArgumentError.new("too many tiles!")
      end
    end

  end
end
