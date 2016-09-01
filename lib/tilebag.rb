require_relative '../scrabble.rb'
require_relative 'scrabble_scoring.rb'
require_relative 'scrabble_player.rb'

class Scrabble::Tilebag
attr_reader :tiles

  def initialize

    @tiles = Scrabble::LETTER_ARRAY

  end

  def draw_tiles(num)
    rack = []
    rack << @tiles.flatten.sample(num)
    return rack
  end
end

joe = Scrabble::Tilebag.new
print joe.draw_tiles(7)
