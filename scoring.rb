module Scrabble
    class Scoring
        attr_reader :test
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
            @test = 3
        end

    end
end
