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
          scores = {}
          words_array.each do |word|
              scores[word] = score(word)
          end
          # puts scores
          #compare values ; hash.max_by{ |k,v| v }[0] ????
          greatest_val = scores.max_by{|k,v| v}[1] # this is the val
          my_array = []
          scores.each do |k,v|
            if v == greatest_val
              my_array << k
            end
          end
          puts my_array

          # Use my_array to look for all the preferences.

      end
  end
end

Scrabble::Scoring.highest_score_from(["rats", "tag", "aei"])
