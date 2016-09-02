# create the Player class

require_relative 'scoring'
require_relative 'tile_bag'

module Scrabble
    class Player
        attr_accessor :name, :plays, :won, :total_score, :tiles

        def initialize(name)
            @name = name
            @plays = []
            @tiles = []
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

            # verify if the played word is in the tiles array, and remove the letters in word from tiles array
            played_letter = word.upcase.split("")

            clone_tiles = @tiles.clone
            played_letter.each do |letter|
                index = clone_tiles.find_index(letter)
                if index.is_a?(Fixnum)
                    clone_tiles.delete_at(index)
                else
                    puts "This word is not calling from your tiles!"
                    return nil
                end
            end

            @tiles = clone_tiles

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

        def draw_tiles(tile_bag)
            if !tile_bag.is_a?(Scrabble::TileBag)
                raise ArgumentError, "Parameter should be an instance of the TileBag class"
            end

            if @tiles.length < 7
                tiles_needed = 7 - @tiles.length
                @tiles += tile_bag.draw_tiles(tiles_needed)
            else
                puts "This player cannot draw more tiles."
            end

            return @tiles
        end # draw_tiles

    end # Player class
end # Scrabble class
