module Scrabble
  class Scoring
    attr_accessor :words
    #letters and their corsponding scores in a hash
    LETTERS = {1 => %w(A E I O U L N R S T), 2 => %w(D G), 3 => %w(B C M P), 4 => %w(F H V W Y), 5 => ["K"], 8 => %w(J X), 10 => %w(Q Z) }

    def initialize
      #
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
      if array_of_words.class != Array || array_of_words == []
        raise ArgumentError.new("Invalid input")
      end
      word_scores= {}
      array_of_words.each do |i|
        letter_score = score(i)
        if word_scores.keys.include?(letter_score)
          word_scores[letter_score] << i
        else
          word_scores[letter_score] = [i]
        end
      end
      max_score = word_scores.keys.max
      if word_scores[max_score].length == 1
        return word_scores[max_score]
      else
        shortest_letters = 7
        shortest_word = ""
        word_scores[max_score].each do |arry_of_vals|
          if arry_of_vals.length < shortest_letters
            shortest_letters = arry_of_vals.length
            shortest_word = arry_of_vals
          elsif arry_of_vals.length == 7
            return arry_of_vals
          end
        end
        return shortest_word
      end
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
