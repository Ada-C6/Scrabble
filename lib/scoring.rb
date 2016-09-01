# @todo fix error for empty word
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
    SEVEN_LETTER_BONUS = 50

    attr_reader :word

    def initialize(word)
      @word = word


    end

    def self.score(word) #won't raise error for '' whyyyy
      invalid_words = word.upcase[/[^A-Z]/]
      current_word = word.upcase

      raise ArgumentError.new("Invalid word") if
      invalid_words == current_word
      score = 0
      word_array = word.upcase.split(//)
      word_array.each do |letter|
        score += Scrabble::Scoring::TILES[letter]
      end
      if word_array.length !=7
        return score
      else

        return score += SEVEN_LETTER_BONUS
      end
    end

    def self.highest_score_from(array_of_words)
      max_score = 0
      max_words = []
      winning_word = 'PIZZAZZas'
      array_of_words.each do |word|
        current_score = score(word)
        if current_score == max_score
          max_words << word
        elsif current_score > max_score
          max_words = [word]
          max_score = current_score
        else
          #karion
        end
      end #each
      max_words.each do |word|
        if word.length < winning_word.length
          winning_word = word
        elsif word.length == 7
          winning_word = word
          return winning_word
        else
          # karion
        end
      end
      return winning_word # will return the first if tie breaker
    end
  end

end
