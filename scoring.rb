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
          letters = word.upcase.chars
          letters.each do |ch|
              if !("A".."Z").include?(ch)
                  return false
              end
          end
          return true
      end

      def self.score(word)
          if !is_alpha?(word)
            raise ArgumentError.new("Oops, letters only please")
          end

          if !valid_length?(word)
            raise ArgumentError.new("Your word must be 1-7 letters.")
          end
      end
  end
end

puts Scrabble::Scoring::SCORE_TABLE
