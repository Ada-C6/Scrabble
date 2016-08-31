# create the Player class
module Scrabble
    class Player
        attr_reader :name

        def initialize(name)
            @name = name

            # if !name.is_s?
            #     rais
            # ("Invalid input. Please give us a string.")
        end
    end
end
