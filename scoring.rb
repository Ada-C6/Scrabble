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
			score = 0
			user_word = word.upcase.split("")

			if word.length < 1 || word.length > 7
				raise ArgumentError.new("No empty strings")
			end

			valid_letters = []
			LETTERS.values.each do |array|
				array.each do |letter|
					valid_letters << letter
				end
			end

			user_word.each do |letter|
				if !valid_letters.include?(letter)
					raise ArgumentError.new("Invalid characters")
				end
			end

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

		def self.highest_score_from(array_of_words)
			scoring_hash = {}
			max_words = []
			raise ArgumentError.new("Invalid input type") if !array_of_words.is_a?(Array)
			array_of_words.each do |word|
				scoring_hash[word] = Scrabble::Scoring.score(word)
			end

			max_val = scoring_hash.values.max
			scoring_hash.each do |key, value|
				if value == max_val
					max_words << key
				end
			end

			max_words.sort_by! {|word| word.length}

			if max_words.last.length == 7
				return max_words.last
			else
				return max_words.first
			end
		end
	end
end
