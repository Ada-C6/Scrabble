require_relative 'scoring'

module Scrabble
    class Player
        attr_reader :name, :plays, :total_score

        def initialize(name)
            @name = name
            @plays = []
            @total_score = 0
        end

        def play(word)
            if won?
              return false
            end
            result = Scoring.score(word)
            @plays << word
            @total_score += result
            return result

        end

        def won?
            return @total_score > 100
        end

        def highest_scoring_word
          return Scoring.highest_score_from(@plays)
        end

        def highest_word_score
          return Scoring.score(highest_scoring_word)
        end
    end
end

# c = Scrabble::Player.new("me")
# c.play("penguin")
# c.play("it")
# puts c.play("do")
#
# puts "foo"
# print c.plays
# puts "bar"
# puts c.highest_scoring_word
