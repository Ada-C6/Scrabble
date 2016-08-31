# create the Player class

require_relative 'scoring'

module Scrabble
    class Player
        attr_reader :name

        def initialize(name)
            @name = name

            if !name.is_a?(String)
                raise ArgumentError, "Invalid input. Please give us a string."
            end
        end


    end
end
