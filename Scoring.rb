module Scrabble
  class Scoring
    attr_accessor :array_of_words, :word
    attr_reader

    SCORE_CHART = {
      1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      2 => ["D", "G"],
      3 => ["B", "C", "M", "P"],
      4 => ["F", "H", "V", "W", "Y"],
      5 => ["K"],
      8 => ["J", "X"],
      10 => ["Q", "Z"]
    }

    @array_of_words = []
    #
    def initialize(word)
      @word = word
      collect_word(word)
    end

    def collect_word(word)
      # @array_of_words << word
    end

    def self.score(word)
      letter_array = word.upcase.split(//)
      single_word_score = []

      letter_array.each do |i|
        Scrabble::Scoring::SCORE_CHART.each do |letter_score, letters|
          if letters.include? i
            single_word_score << key
            break
          end
        end
      end

      if key's array .include? i, return key(i)



      # single_word_score.inject(:+)
    end

    def self.highest_score_from_array(array_of_words)
    end

  end
end
