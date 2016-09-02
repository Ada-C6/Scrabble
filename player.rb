require_relative 'scoring'
require_relative 'tile_bag'

module Scrabble
    class Player
        attr_reader :name, :plays, :total_score, :tiles

        def initialize(name)
            @name = name
            @plays = []
            @total_score = 0
            @tiles = []
        end

        def play(word)
            if won?
              return false
            end
            if !valid_word?(word)
                raise ArgumentError.new("Oops, you don't have tiles to play this word--please try another word.")
                return false
            end
            result = Scoring.score(word)
            @plays << word
            @total_score += result
            return result
        end

        def valid_word?(word)
            temporary_tiles = @tiles.clone
            word.chars.each do |ch|
                if temporary_tiles.include?(ch)
                    temporary_tiles.delete(ch)
                else
                    return false
                end
            end
            @tiles = temporary_tiles
            return true
        end

        def won?
            return @total_score > 100
        end

        def highest_scoring_word
            if @plays == []
                raise ArgumentError.new("Oops! You haven't played anything")
            end
          return Scoring.highest_score_from(@plays)
        end

        def highest_word_score
          return Scoring.score(highest_scoring_word)
        end

        def draw_tiles(bag)
            num = 7 - @tiles.length
            @tiles.concat(bag.draw_tiles(num))
        end
    end
end

# c = Scrabble::Player.new("me")
# current_bag = Scrabble::TileBag.new
# c.draw_tiles(current_bag)
# puts "Here's our tiles #{c.tiles.to_s}."
# c.play("penguin")

# c.play("it")
# puts c.play("do")
#
# puts "foo"
# print c.plays
# puts "bar"
# puts c.highest_scoring_word
