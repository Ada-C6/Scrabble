require_relative 'player'
require_relative 'scoring'

module Scrabble

  class TileBag
    attr_accessor :default_tiles, :tile_count

    def initialize
      @default_tiles =
      { "A" =>9,"E" =>12, "I" =>9, "O"=>8, "U"=>4, "L"=>6, "N"=>6, "R" => 6,"S"=> 4,"T" => 6,"D"=>4,"G"=>3,"B"=>2,
        "C"=>2,
        "M"=>2, "P" => 2,"F"=>2, "H"=>2, "V"=>2, "W"=>2, "Y"=>2, "K"=>1, "J" =>1, "X"=>1, "Q"=>1, "Z" => 1 }
        @tile_count = 100
    end

      def draw_tiles(num)
        my_tiles = []
        letter = ""
        new_value = 0
        num.times do

          letter =  @default_tiles.keys.sample
          my_tiles << letter
          new_value = @default_tiles.fetch_values(letter) {|k ,v| v}.join.to_i - 1
          secret_hash = {letter =>new_value}
          @default_tiles = @default_tiles.merge(secret_hash)
        end
        return my_tiles
      end

      def tiles_remaining
        total = 0

        @default_tiles.map do |k, v|
         total += v
         @tile_count = total
        end
        return @tile_count
      end


  end
end
