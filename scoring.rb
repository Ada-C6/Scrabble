module Scrabble
    class Scoring
        SCORE_TABLE = {
            1 => %w(A E I O U L N R S T),
            2 => %w(D G),
            3 => %w(B C M P),
            4 => %w(F H V W Y),
            5 => ["K"],
            8 => %w(J X),
            10 => %w(Q Z)
        }

        def self.valid_length?(word)
            return word.length <= 7 && word.length > 0
        end

        def self.is_alpha?(word)
            letter_array(word).each do |ch|
                if !("A".."Z").include?(ch)
                    return false
                end
            end
            return true
        end

        def self.letter_array(word)
            return word.upcase.chars
        end

        def self.score(word)
            if !is_alpha?(word)
                raise ArgumentError.new("Oops, letters only please")
            end

            if !valid_length?(word)
                raise ArgumentError.new("Your word must be 1-7 letters.")
            end

            score = 0
            letter_array(word).each do |ch|
                SCORE_TABLE.each do |k, v|
                    if v.include?(ch)
                        score += k
                    end
                end
            end

            if letter_array(word).length == 7
                score += 50
            end
            return score
        end

        def self.highest_score_from(words_array)
            scores = []

            words_array.each do |word|
                scores << score(word)
            end

            greatest_val = scores.max

            winners = []
            winners_lengths = []
            
            index = 0
            while index < words_array.length
                if scores[index] == greatest_val
                    winners << words_array[index]
                    winners_lengths << words_array[index].length
                end
                index += 1
            end

            if winners.length == 1
                return winners[0]
            elsif winners_lengths.include?(7)
                return winners[winners_lengths.index(7)]
            else
                return winners[winners_lengths.index(winners_lengths.min)]
            end
        end
    end
end

# Scrabble::Scoring.highest_score_from(["tag", "rats", "tag", "aei"])
