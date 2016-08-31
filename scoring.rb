module Scrabble
    class Scoring
        attr_reader

        HASH ={
            "1" => %w(A E I O U L N R S T),
            "2" => %w(D G),
            "3" => %w(B C M P),
            "4" => %w(F H V W Y),
            "5" => %w(K),
            "8" => %w(J X),
            "10" => %w(Q Z)
        }

        def initialize
        end

        def self.bonus(word)
            word.length == 7 ? bonus_score = 50 : bonus_score = 0
            return bonus_score
        end

        def self.score(word)
            if word.class != String
                raise ArgumentError, "Invalid input"
            end

            arr = word.split('')

            score = 0

            arr.each do |i|
                result = nil
                HASH.each do |k, v|
                    if v.include?(i)
                        result = k.to_i
                        score += result
                    end
                end
            end

            return score + self.bonus(word)

        end # self.score method

        def self.highest_score_from(array_of_words)
            if array_of_words.class != Array
                raise ArgumentError, "Invalid input"
            end

            # create a hash that store the score-word(s) pairs
            score_result = {}

            array_of_words.map do |word|
                score = self.score(word)
                if score_result.keys.include?(score)
                    score_result[score] += [word]
                else
                    score_result[score] = [word]
                end
            end

            # retrieve the highest score key in the hash
            highest_score = score_result.keys.max

            # retrieve the array value corresponding to the highest score key in the hash
            winning_array = score_result[highest_score]

            # now we consider the length of words inside the winning array
            # create a hash that store the length-words pairs
            winning_hash = {}
            winning_array.map do |word|
                len = word.length
                if winning_hash.keys.include?(len)
                    winning_hash[len] += [word]
                else
                    winning_hash[len] = [word]
                end
            end

            # first check which word has 7 letters, then check for the letter with the shortest length. 'first' method on array will ensure we retrieve the letter who comes first in the original array input.
            if winning_hash.keys.include?(7)
                winning_word = winning_hash[7].first
            else
                winning_word = winning_hash[winning_hash.keys.min].first
            end

            return winning_word
        end

    end # Scoring class
end # Scrabble module
