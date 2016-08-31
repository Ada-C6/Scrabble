module Scrabble
  class Scoring

    POINTS = {
      "A" => 1,
      "B" => 3,
      "C" => 3,
      "D" => 2,
      "E" => 1,
      "F" => 4,
      "G" => 2,
      "H" => 4,
      "I" => 1,
      "J" => 8,
      "K" => 5,
      "L" => 1,
      "M" => 3,
      "N" => 1,
      "O" => 1,
      "P" => 3,
      "Q" => 10,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "U" => 1,
      "V" => 4,
      "W" => 4,
      "X" => 5,
      "Y" => 4,
      "Z" => 10}

    attr_accessor :word, :round_words

    def initialize
      @word = word
      @round_words = []
    end

    def self.score(word)
      sum = 0
      Scrabble::Scoring::POINTS.each do |k, v|
        occurances = word.count(k.to_s)
        sum += v.to_i * occurances
      end
      if word.length == 7
        sum +=50
      end
      return sum
    end

    def self.highest_score_from(array_of_words)
      scored_word = {}
      array_of_words.each do |word|
        scored_word[word] = self.score(word)
      end
      return 0

    end

    #  highest_test.max_by{|k,v| v}


  end
end

Scrabble::Scoring.new
Scrabble::Scoring.score("HOUSE")
Scrabble::Scoring.score("ANIMAL")
Scrabble::Scoring.score("DOG")
