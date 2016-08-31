module Scrabble
  class Scoring
    attr_accessor :array_of_words, :word, :length, :score
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

    def initialize
      @array_of_words = array_of_words
    end

    def collect_word_from_user(word)
      @word = word
    end

    # # nope
    # def store_all_game_words(word)
    #   @array_of_words << word
    # end

    def self.score(word)
      raise ArgumentError.new("invalid input type") unless word.is_a?(String)

      letter_array = word.upcase.split(//)
      single_word_score = []

      letter_array.each do |i|
        Scrabble::Scoring::SCORE_CHART.each do |letter_score, letters|
          if letters.include?(i)
            single_word_score << letter_score
            break
          end
        end
      end

      single_word_score.reduce(:+)
    end

    def self.highest_score_from_array(array_of_words)
      raise ArgumentError.new("invalid input type") unless array_of_words.is_a?(Array)

      array_of_words.each do |word|
        raise ArgumentError.new("invalid input type") unless word.is_a?(String)
      end

      score_array = []
      array_of_words.each do |word|
        word_score = word.score
        score_array << word_score
      end

      return single_word_score.max
    end

  end
end
