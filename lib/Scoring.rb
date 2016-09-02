require_relative "../module"

class Scrabble::Scoring

  attr_reader :word
  attr_accessor :total

  def self.score(word)
    # create an array of strings (letters) from word
    # loop through letters array in order to determine total score (by referencing LETTER_HASH)

    return 0 if word.nil? || word.empty?

    letters = word.upcase.split('')

    letters.length >= 7 ? total = 50 : total = 0

    letters.each do |letter|
      total += Scrabble::LETTER_HASH[letter]
      
    end

    return total

  end

  def self.highest_score_from(array_of_words)
    # initialize two variables in order to hold max_score and max_scoring_word
    # iterate through the array_of_words and use if statements to determine when the word and score are stored in the local variables
    # use tie-breaking logic in if statements to determine when to score word/score into variable
    max_score = 0
    max_scoring_word = ""

    array_of_words.each do |word|
      if score(word).to_i > max_score
        max_score = score(word)
        max_scoring_word = word
      elsif score(word).to_i == max_score
        if word.chars.count >= 7
          max_score = score(word)
          max_scoring_word = word
        elsif word.chars.count < max_scoring_word.chars.count
          max_score = score(word)
          max_scoring_word = word
        end
      end
    end
    return max_scoring_word
  end
#class end.
end
