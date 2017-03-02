require_relative 'scoring.rb'
module Scrabble
  class TileBag
  attr_reader :collection

  def initialize
    @collection = []
    1.times do
      @collection << "Q"
      @collection << "J"
      @collection << "K"
      @collection << "X"
      @collection << "Z"
    end

    2.times do
      @collection << "M"
      @collection << "B"
      @collection << "C"
      @collection << "F"
      @collection << "H"
      @collection << "V"
      @collection << "W"
      @collection << "Y"
      @collection << "P"
    end

    12.times do
      @collection << "E"
    end

    9.times do
      @collection << "A"
      @collection << "I"
    end

    8.times do
      @collection << "O"
    end

    6.times do
      @collection << "N"
      @collection << "T"
      @collection << "R"
    end

    4.times do
      @collection << "D"
      @collection << "L"
      @collection << "S"
      @collection << "U"
    end

    3.times do
      @collection << "G"
    end

    @collection.shuffle! #we're shuffling the tiles in initialize so that we don't have to shuffle it each time we draw a tile.
  end

  def draw_tiles(num)
    tiles_drawn = @collection.pop(num) #remove one tile off the end
    return tiles_drawn
  end

  def tiles_remaining
    #this adds the values in the collection, the values are how many there are of each letter tile.
    @collection.length
  end

  end
end

# #### Modifications to `Player`
# Create specs for (__minimum 2__) and add to the `Player` class the following instance methods:
#
# - `#tiles` a collection of letters that the player can play (max 7)
# - `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag
#
# ### Optional Enhancements
# - Create a `Scrabble::Dictionary` class that includes a method (class or instance) for searching a list of words to determine if a given word is valid (__minimum of 5 specs__).
# - Create a `Scrabble::Board` class (__minimum of 15 specs__) that has a matrix (array of arrays) of tile places. Check if a word can be played on a given tile place in a certain direction (up/down or left/right).
# -->
