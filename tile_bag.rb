module Scrabble
    class TileBag
        TILES = {
            "A"=>9,
            "B"=>2,
            "C"=>2,
            "D"=>4,
            "E"=>12,
            "F"=>2,
            "G"=>3,
            "H"=>2,
            "I"=>9,
            "J"=>1,
            "K"=>1,
            "L"=>4,
            "M"=>2,
            "N"=>6,
            "O"=>8,
            "P"=>2,
            "Q"=>1,
            "R"=>6,
            "S"=>4,
            "T"=>6,
            "U"=>4,
            "V"=>2,
            "W"=>2,
            "X"=>1,
            "Y"=>2,
            "Z"=>1,
        }

        attr_accessor :collection

        def initialize
            @collection = []
            Scrabble::TileBag::TILES.each do |k, v|
                v.times do
                  @collection << k
                end
              end
        end # initialize

        def draw_tiles(num)
            if !num.is_a?(Fixnum)
                raise ArgumentError, "Invalid input"
            end

            @collection.shuffle!

            draw_array = @collection.pop(num)

            return draw_array
        end

        def tiles_remaining
            return @collection.length
        end
    end # TileBag
end # Scrabble
