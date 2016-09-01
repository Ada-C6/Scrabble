# create the Player class

require_relative 'scoring'

module Scrabble
    class Player
        attr_accessor :name, :plays, :won, :total_score

        def initialize(name)
            @name = name
            @plays = []
            @won = false
            @total_score = 0

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

        def total_score
            @plays.each do |word|
                word_score = Scrabble::Scoring.score(word)
                @total_score += word_score
            end
            return @total_score
        end

        def won?
            return @total_score > 100 ? true : false
        end

        def highest_scoring_word
            if @plays.length == 0
                puts "This player hasn't played yet."
                return nil
            else
                return Scrabble::Scoring.highest_score_from(@plays)
            end
        end

        def highest_word_score
            if highest_scoring_word == nil
                puts "He/she has no score!"
                return nil
            else
                return Scrabble::Scoring.score(highest_scoring_word)
            end
        end
    end # Player class
end # Scrabble class
