module Scrabble
  class TileBag

    TILES_BAG = {
      "A" => 9,
      "E" => 1,
      "I" => 9,
      "O" => 8,
      "U" => 4,
      "L" => 4,
      "N" => 6,
      "R" => 6,
      "S" => 4,
      "T" => 6,
      "D" => 4,
      "G" => 3,
      "B" => 2,
      "C" => 2,
      "M" => 2,
      "P" => 2,
      "F" => 2,
      "H" => 2,
      "V" => 2,
      "W" => 2,
      "Y" => 2,
      "K" => 1,
      "J" => 1,
      "X" => 1,
      "Q" => 1,
      "Z" => 1
    }

    attr_reader :game_tile_bag

    def initialize
      @game_tile_bag = TILES_BAG.clone

    end

    def draw_tiles(num)
      sum_of_all_tiles = @game_tile_bag.values.reduce(:+)
      if sum_of_all_tiles < num
        raise Exception.new("Cannot draw more tiles than currently in bag.")
      end
      new_player_tiles = 0
      alphabet_array = []
     @game_tile_bag.map do |key, value|
        value.times do
          alphabet_array << key
          # =>["A", "A", "A", "F", "F", "G"]
        end
      end

      new_player_tiles = alphabet_array.sample(num) #array of drawn letters
      new_player_tiles.each do |letter|
        @game_tile_bag[letter] -= 1
      end
      return new_player_tiles #array of letters
    end #draw_tiles



  end
end
