require_relative '../scrabble'

class Scrabble::Tilebag
attr_reader :tiles

  def initialize
    @tiles = clone_constant
  end

  def clone_constant
    clone_array = []
    Scrabble::LETTER_ARRAY.each do |small_array|
      clone_array << small_array.clone
    end
    return clone_array
  end

  def draw_tiles(num)
    rack = @tiles.flatten.sample(num)

    # for each drawn letter in rack, this finds the letter's array in @tiles,
    # and pops it off the end of that mini-array
    rack.each do |letter|
      @tiles.assoc(letter).pop
    end

    return rack
  end

  def tiles_remaining
    return @tiles.flatten.length
  end

end
#
#joe = Scrabble::Tilebag.new

# rack = joe.draw_tiles(7)
# ap rack
# joe.tiles.each do |small_array|
#   puts small_array.length
# end
# puts Scrabble::LETTER_ARRAY.length
# # puts "****************"
# # ap joe.tiles.flatten.length
#
#
# # puts rack.length
