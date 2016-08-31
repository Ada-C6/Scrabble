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

    def self.word_to_array(word)
      word.upcase.split(//)
    end


    # return appropriate score for letter
    def self.score (word)
      score = 0
      word_array = self.word_to_array(word)

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
        # should return the word with the highest score
        if score > winning_score
          winner = word
          winning_score = score

        elsif score == winning_score
          # should return the first word supplied in the case of tie of both score and length
          unless winner.length == 7 # this runs if winner length is not 7
            # should return the 7 letter word if there is a tie
            if word.length == 7 # if word length is 7, word is winner
              winner = word
              winning_score = score

            # if score tie, shorter length wins
            elsif word.length < winner.length
              winner = word
              winning_score = score
            end
          end
        end
      end
      return winner
    end

  end
end
