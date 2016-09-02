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
      # check if each letter of the word is included in the tiles list
      a = word.scan /\w/
      check_tiles = @tiles.clone
      a.each do |i|
        # if it's included, remove from temporary list to account for duplicate letters in a word
        if check_tiles.include?(i)
          check_tiles.delete_at(check_tiles.index(i))
        # exit method and don't change list of tiles
        else
          puts "it's not a valid word"
          return nil
          # end
        end
      end

      # update list of remaining tiles
      @tiles = check_tiles
      # add word to list of player's played words
      @plays << word
      # calculate and add word score
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

    # @tiles is an array of an individual player.
    def tiles
      if @tiles.length <= 7
        return @tiles
      else
        puts "uh oh, something went wrong"
      end
    end

    def draw_tiles(tile_bag)
      # calculate number of tiles needed to fill rack
      tiles_needed = 7 - @tiles.length
      # if there are enough tiles to fill rack, fill it
      if tiles_needed < tile_bag.tiles_remaining
        tiles_needed.times do
          @tiles << tile_bag.draw_tiles(1)
        end
        # if there are not enough tiles to fill the rack, take as many as are left
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

# p= Scrabble::Player.new("selam")
# # p.play
# # p.plays = ["car", "birdand", "home"]
# # puts p.highest_scoring_word
# # puts p.highest_word_score
# p.tiles = ["h", "e", "l", "l", "o","c", "w"]
# puts p.play("son")
# puts p.tiles
