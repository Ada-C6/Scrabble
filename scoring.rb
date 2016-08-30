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

      def self.is_alpha?(word)
          letters = word.upcase.chars
          letters.each do |ch|
              if !("A".."Z").include?(ch)
                  return false
              end
              return true
          end
      end

      def self.score(word)
          if !is_alpha?(word)
              raise ArgumentError.new("Oops, letters only please")
          end
      end
  end
end

puts Scrabble::Scoring::SCORE_TABLE
