module Scrabble
  class Scoring
    attr_reader :letters

    SCORE_CHART = { 1 => %w(A E I O U L N R S T), 2 => %w(D G), 3 => %w(B C M P), 4 => %w(F H V W Y), 5 => %w(k), 8 => %w(J X), 10 => %w(Q Z)}

    def initialize (letters)
      @letter = []
    end

  end
end
