# create the Player class

require_relative 'scoring'

module Scrabble
    class Player
        attr_accessor :name, :plays, :won

        def initialize(name)
            @name = name
            @plays = []
            @won = false

            if !name.is_a?(String)
                raise ArgumentError, "Invalid input. Please give us a string."
            end
        end

        def play(word)
            if !word.is_a?(String)
                raise ArgumentError, "Invalid input. Please give us a string."
            end

            # add new word to @plays instance variable
            @plays << word.upcase

            # if won, return false. if not won, return word score
            return @won == true ? false : Scrabble::Scoring.score(word)
        end # play(word)
    end # Player class
end # Scrabble class
