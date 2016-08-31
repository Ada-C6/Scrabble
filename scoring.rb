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

            score_result = {}

            array_of_words.map do |word|
                score = self.score(word)
                if score_result.keys.include?(score)
                    score_result[score] += [word]
                else
                    score_result[score] = [word]
                end
            end
            puts score_result # @todo - delete/debug
            highest_score = score_result.keys.max
            winning_word = score_result[highest_score].first
            puts winning_word # @todo - delete/debug
            return winning_word
        end

    end # Scoring class
end # Scrabble module
