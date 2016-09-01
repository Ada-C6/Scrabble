module Scrabble

  TILES = {
    "A" => 9,
    "B" => 2,
    "C" => 2,
    "D" => 4,
    "E" => 12,
    "F" => 2,
    "G" => 3,
    "H" => 2,
    "I" => 9,
    "J" => 1,
    "K" => 1,
    "L" => 4,
    "M" => 2,
    "N" => 6,
    "O" => 8,
    "P" => 2,
    "Q" => 1,
    "R" => 6,
    "S" => 4,
    "T" => 6,
    "U" => 4,
    "V" => 2,
    "W" => 2,
    "X" => 1,
    "Y" => 2,
    "Z" => 1
  }

  class TileBag
    attr_accessor :letters_available, :snapshot


    def initialize
      @letters_available=[]
      @snapshot = []
    end

    def fill_bag
      static_tiles = []
      TILES.each do |k,v|
        v.times do
          static_tiles.push(k)
        end
      end
      @snapshot = static_tiles.clone
      @letters_available = static_tiles.shuffle
      return @letters_available
    end

  end

end

jm = Scrabble::TileBag.new
jm.fill_bag
