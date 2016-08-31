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

    attr_accessor :word, :round_words, :bonus, :highest_words

    def initialize
      @word = word
      @round_words = []
    end

    def self.score(word)
      sum = 0
      @bonus = 0
      Scrabble::Scoring::POINTS.each do |k, v|
        occurances = word.count(k.to_s)
        sum += v.to_i * occurances
      end
      puts "each word: #{word} #{sum}"
      if word.length == 7
        @bonus = 50
      end

      sum += @bonus
      return sum
    end

    def self.highest_score_from(array_of_words)
      scored_word = {}
      array_of_words.each do |word|
        scored_word[word] = self.score(word)
      end
      puts scored_word
      max_score = scored_word.max_by{|k,v| v}[1]

      @highest_words = []

      scored_word.each do |k,v|
        if v == max_score
          @highest_words.push(k)
        end
      end
      self.tie_breaker(@highest_words)
    end

    def self.tie_breaker(array_of_highest_words)
      array_of_highest_words.sort

      if array_of_highest_words.length == 1
        winner = array_of_highest_words[0]
        puts winner
        return winner

      elsif array_of_highest_words.length > 1

        if array_of_highest_words.any? { |word| word.length == 7 }
          array_of_highest_words.each do |palabra|
            if palabra.length == 7
              winner = palabra
              return winner
            end
          end

         else
          winner = array_of_highest_words.min_by { |word| word.length }
          puts winner
          return winner

        # The third tiebreaker condition (tile/point tie) is automatically met due to Ruby's preference to pick the first word with equal points and character length

        end
      end

    end
  end
end

Scrabble::Scoring.new
Scrabble::Scoring.score("HOUSE")
Scrabble::Scoring.score("ANIMAL")
Scrabble::Scoring.score("DOG")


Scrabble::Scoring.new
Scrabble::Scoring.score("RAT")
Scrabble::Scoring.score("LINES")
Scrabble::Scoring.score("DOG")

Scrabble::Scoring.highest_score_from(["QQQQQQJ", "GORILLA", "RAT"])
Scrabble::Scoring.highest_score_from(["LINES","DOG","RAT"])
Scrabble::Scoring.highest_score_from(["LINES","dog".upcase,"GOD","RAT"])
