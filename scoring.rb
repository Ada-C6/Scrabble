module Scrabble
  class Scoring

    LETTERS = {1 => %w(A E I O U L N R S T), 2 => %w(D G), 3 => %w(B C M P), 4 => %w(F H V W Y), 5 => ["K"], 8 => %w(J X), 10 => %w(Q Z) }

    def initialize
      @words = []
    end

    def self.score(word)
        word.upcase!
      current_score = 0
      word_letters = word.split("")

      word_letters.each do |i|
        if !LETTERS.values.join.include?(i)
          raise ArgumentError.new("Invalid input")
        end
        LETTERS.values.length.times do |j|
          if LETTERS.values[j].include?(i)
            current_score += LETTERS.keys[j]
            break
          end
        end
      end
      return current_score
    end

  end
end
