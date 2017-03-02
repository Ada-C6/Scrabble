module Scrabble
  class TileBag
    attr_reader :bag_of_tiles

    def initialize
      @bag_of_tiles = Scrabble::TileBag.populate_tiles
      #should have the correct number of tiles of each letter
    end

    LETTER_DISTRIBUTION = {
      A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1}

    def self.populate_tiles
      tbag_array = []

      LETTER_DISTRIBUTION.each do |letter, quantity|
        quantity.times do
          tbag_array << letter.to_s
        end
      end
      return tbag_array
    end

    # draw_tiles(num) returns num number of random tiles, removes the tiles from the default set.
    def draw_tiles (num)
      tiles_drawn = @bag_of_tiles.sample(num)
      tiles_drawn.each do | tile |
        @bag_of_tiles.slice!(@bag_of_tiles.index(tile))
      end
      return tiles_drawn
    end

    def tiles_remaining
      return @bag_of_tiles.length
    end


  end
end
