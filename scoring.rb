module Scrabble


  class Scoring

    SCORE_CHART = {
      1 => %w(A E I O U L N R S T),
      2 => %w(D G),
      3 => %w(B C M P),
      4 => %w(F H V W Y),
      5 => %w(K),
      8 => %w(J X),
      10 => %w(Q Z)
    }


    def self.score (word)
      word_array = word.upcase.split(//)
      score = 0

      word_array.each do | i |
        SCORE_CHART.each do | key, value |
          if SCORE_CHART[key].include?(i)
          score += key
          end
        end
      end
      return score
    end
  end
end
