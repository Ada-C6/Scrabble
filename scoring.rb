module Scrabble
  class Scoring
    attr_accessor :words

    LETTERS = {1 => %w(A E I O U L N R S T), 2 => %w(D G), 3 => %w(B C M P),
      4 => %w(F H V W Y), 5 => ["K"], 8 => %w(J X), 10 => %w(Q Z) }

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

        if word_letters.length == 7
          current_score += 50
        end

        # @words << word
        return current_score
      end

      def self.highest_score_from(array_of_words)
        word_scores= {}
        array_of_words.each do |i|
          letter_score = score(i)
          if word_scores.keys.include?(letter_score)
            word_scores[letter_score] << i
          else
            word_scores[letter_score] = [i]
          end
        end
        max_scores = word_scores.key
        if max_scores.length == 1
          return max_scores
        else


          return word_scores
        end



        # highest_score = 0
        # highest_word = ""
        # array_of_words.each do |i|
        #   if score(i) > highest_score
        #     highest_score = score(i)
        #     highest_word = i
        #   end
        # end
        # return highest_word


      end
    end
end
