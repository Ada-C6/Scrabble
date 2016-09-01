module Scrabble
    class TileBag
        attr_reader :tiles, :tiles_remaining

        def initialize
            @tiles = ["J", "K", "Q", "X", "Z"] + ["B", "C", "F", "H", "M", "P", "V", "W", "Y"]*2 + ["G"]*3 + ["D", "L", "S", "U"]*4 + ["N", "R", "T"]*6 + ["O"]*8 + ["A", "I"]*9 + ["E"]*12
            @tiles_remaining = @tiles.length
        end
    end
end
