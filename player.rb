require_relative 'scoring'
require_relative 'tilebag'
module Scrabble
  class Player
    attr_reader :name
    attr_accessor :plays, :total, :highest_word, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @total = 0
      @highest_word = ""
      @tiles = []
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

    def highest_scoring_word
      @highest_word = Scrabble::Scoring.highest_score_from(@plays)
      return @highest_word
    end

    def highest_word_score
      highest_word = highest_scoring_word
      highest_score = Scrabble::Scoring.score(highest_word)
      return highest_score
    end

    def tiles
      if @tiles.length <= 7
        return @tiles
      else
        puts "uh oh, something went wrong"
      end
    end

    def draw_tiles(tile_bag)
      tiles_needed = 7 - @tiles.length
      if tiles_needed < tile_bag.tiles_remaining
        tiles_needed.times do
          @tiles << tile_bag.draw_tiles(1)
        end
      else
        until tile_bag.tiles_remaining == 0
          @tiles << tile_bag.draw_tiles(1)
        end
      end
      @tiles.flatten!
      return tiles
    end
  end
end


# p= Scrabble::Player.new("hello")
# p.play
# p.plays = ["car", "birdand", "home"]
# puts p.highest_scoring_word
# puts p.highest_word_score
