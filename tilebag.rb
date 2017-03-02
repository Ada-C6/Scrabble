module Scrabble
	class TileBag
		attr_reader :tiles
		attr_accessor :available_tiles

		def initialize
			@tiles = {
				"A" => 9, "B" => 2,
				"C" => 2, "D" => 4,
				"E" => 12, "F" => 2,
				"G" => 3, "H" => 2,
				"I" => 9, "J" => 1,
				"K" => 1, "L" => 4,
				"M" => 2, "N" => 6,
				"O" => 8, "P" => 2,
				"Q" => 1, "R" => 6,
				"S" => 4, "T" => 6,
				"U" => 4, "V" => 2,
				"W" => 2, "X" => 1,
				"Y" => 2, "Z" => 1
			}

		end

		def draw_tiles(num)
			raise ArgumentError.new("Invalid argument type") if !num.is_a?(Fixnum)

			pick = []
			if num > tiles_remaining
				num = tiles_remaining
			end
			until pick.length == num
				tile = @tiles.keys.sample
				until @tiles[tile] != 0
					tile = @tiles.keys.sample
				end
				pick << tile
				@tiles[tile] -= 1
			end

			return pick
		end

		def tiles_remaining
			remaining_val = @tiles.values.reduce(:+)
			return remaining_val
		end
	end
end
