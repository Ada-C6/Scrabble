module Scrabble

  class Scoring

    TILES = {
      "A" => 1,
      "E" => 1,
      "I" => 1,
      "O" => 1,
      "U" => 1,
      "L" => 1,
      "N" => 1,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "D" => 2,
      "G" => 2,
      "B" => 3,
      "C" => 3,
      "M" => 3,
      "P" => 3,
      "F" => 4,
      "H" => 4,
      "V" => 4,
      "W" => 4,
      "Y" => 4,
      "K" => 5,
      "J" => 8,
      "X" => 8,
      "Q" => 10,
      "Z" => 10
    }

    attr_reader :word

    def initialize(word)
      @word = word

    end

    def self.score(word)
      score = 0
      word_array = word.upcase.split(//)
      word_array.each do |letter|
        score += Scrabble::Scoring::TILES[letter]
      end
      return score
    end
    def self.highest_score_from(array_of_words)
      max_score = 0
      max_word = ''
      array_of_words.each do |word|
        current_score = score(word)
        if max_score < current_score
          max_score = current_score
          max_word = word
        end #if
      end #each
      return max_word
    end
  end

end
