module Scrabble
  class TileBag

    TILES_BAG = {
      "A" => [1,9],
      "E" => [1,12],
      "I" => [1,9],
      "O" => [1,8],
      "U" => [1,4],
      "L" => [1,4],
      "N" => [1,6],
      "R" => [1,6],
      "S" => [1,4],
      "T" => [1,6],
      "D" => [2,4],
      "G" => [2,3],
      "B" => [3,2],
      "C" => [3,2],
      "M" => [3,2],
      "P" => [3,2],
      "F" => [4,2],
      "H" => [4,2],
      "V" => [4,2],
      "W" => [4,2],
      "Y" => [4,2],
      "K" => [5,1],
      "J" => [8,1],
      "X" => [8,1],
      "Q" => [10,1],
      "Z" => [10,1]
    } # Potential to merge with Scoring TILES later

    attr_reader :game_tile_bag

    def initialize
      @game_tile_bag = TILES_BAG.clone

    end

    def draw_tiles(num)
      new_player_tiles = 0
      available_player_tiles = @game_tile_bag.map { |key, value_array| key} # "A", "B", "C"
      new_player_tiles = available_player_tiles.sample(num) #array of drawn letters
      new_player_tiles.each do |letter|
        @game_tile_bag[letter][1] -= 1
      end
      return new_player_tiles #array
    end #draw_tiles



  end
end
