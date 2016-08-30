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
      if word_array.length == 7
        score += 50
      end
      return score
    end

    def self.highest_score_from(array_of_words)
      winner = ""
      winning_score = 0

      array_of_words.each do |word|
        score = self.score(word)
        if score == winning_score
        # still not sure how to get this to return the 7 letter word if the 6 letter word comes after  
          unless winner.length == 7
          #   if word.length == 7
          #     winner = word
          #     winning_score = score
          #   elsif word.length < winner.length
          #   winner = word
          #   winning_score = score
          end
        elsif score > winning_score
            winner = word
            winning_score = score
        end
      end
      return winner
    end

  end
end
