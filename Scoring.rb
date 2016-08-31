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

      scored_hash = {}
      word_score_array = []

      array_of_words.each do |word|
        word_score = Scrabble::Scoring.score(word)
        word_score_array << word_score

          word_score_array.each do |score|
            scored_hash[score] = Array.new
          end

    #   Need to figure out where this goes: scored_hash[score] << word
      end
      scored_hash

      # array_of_highest_words = scored_hash.max
      # array_of_highest_words[1]
    end

  end
end
