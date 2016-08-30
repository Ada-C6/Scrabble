module Scrabble
	class Scoring
		LETTERS = {
			1 => %w(A E I O U L N R S T),
			2 => %w(D G),
			3 => %w(B C M P),
			4 => %w(F H V W Y),
			5 => ["K"],
			8 => %w(J X),
			10 => %w(Q Z)
		}

		def self.score(word)
			if word.length < 1 || word.length > 7
				raise ArgumentError.new("No empty strings")
			end

			score = 0
			user_word = word.upcase.split("")
			user_word.each do |letter|
				LETTERS.each do |key, value|
					if value.include?(letter)
						score += key
					end
				end
			end
			if user_word.length == 7
				score += 50
			end
			return score
		end
	end
end
