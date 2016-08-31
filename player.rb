require_relative 'scoring'

module Scrabble
    class Player
        attr_reader :name, :plays

        def initialize(name)
            @name = name
            @plays = []
            @total_score = 0
        end

        def play(word)
            return Scoring.score(word)
        end

        def won?
            return @total_score > 100
        end
    end
end
