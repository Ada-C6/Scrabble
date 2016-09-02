require_relative 'scoring'
require_relative 'player'

module Scrabble
  class Tilebag
    attr_reader :all_tiles

    def initialize
      @all_tiles = {
        A: 9,
        B: 2,
        C: 2,
        # D: 4,
        # E: 12,
        # F: 2,
        # G: 3,
        # H: 2,
        # I: 9,
        # J: 1,
        # K: 1,
        # L: 4,
        # M: 2,
        # N: 6,
        # O: 8,
        # P: 2,
        # Q: 1,
        # R: 6,
        # S: 4,
        # T: 6,
        # U: 4,
        # V: 2,
        # W: 2,
        # X: 1,
        # Y: 2,
        # Z: 1
      }
    end

    def tb_draw_tiles(num)
      return_tiles = []

      num.times do
        @all_tiles.delete_if {|key, value| value == 0 }

        tile = @all_tiles.keys.shuffle.pop
        return_tiles << tile
        @all_tiles[tile] -= 1
      end

     return return_tiles
    end

    def tiles_remaining
      return @all_tiles.values.reduce(:+)
    end

  end
end
  # 
  # m = Scrabble::Tilebag.new
  # puts m.tb_draw_tiles(14z)
  #
  # puts m.all_tiles
