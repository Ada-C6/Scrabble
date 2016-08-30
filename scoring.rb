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

        def self.score(word)
            if word.class != String
                raise ArgumentError, "Invalid input"
            end
        end # self.score method

    end # Scoring class
end # Scrabble module



# def score(input, hash)
#   result = nil
#   hash.each do |k, v|
#     if v.include?(input)
#       result = k.to_i
#     end
#   end
#   return result
# end
