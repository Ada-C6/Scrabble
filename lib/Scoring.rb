#1 Create data structure to store individual letter scores - make a CONSTANT in module - DONE

#2 Create Spec file - DONE

#3 Create one red test in Spec file - DONE!

#4 Execute one test - Rake from project root DONE!

#_________________________

#5 create Scrabble::Scoring class with min of 8 specs (from Spec file)

#6 Include the following methods
#a. self.score(word) - return total score for word. Word is input as string (case insensitive).
#b. self.highest_score_from(array_of_words)
#  - output is word in array with highest score
#  - in case of tie, use tie-breaking rules (better to use fewer tiles
#  - fewer tiles with same score wins)
#  - bonus for words of 7 letters - 50 pts.
#  - choose word with 7 letters over one with fewer tiles with same score
#  - same score/same length - first one in supplied list wins

require_relative "../module"

class Scrabble::Scoring

  attr_accessor :word, :total

  def initialize(word)
    @word = word
  end

  # create an array of strings (letters) from word
  # loop through letters array in order to determine total score (by referencing LETTER_HASH)

  def self.score(word)
    letters = word.upcase.split('')

    letters.length >= 7 ? total = 50 : total = 0

    letters.each do |letter|
      total += Scrabble::LETTER_HASH[letter]
    end

    return total

  end


  def self.highest_score_from(array_of_words)
    # output is word in array with highest_score_from
    scored_words_array = []
    array_of_words.each do |word|
       scored_words_array << score(word).to_i
       puts "Word.score #{score(word)}"
    end
    return scored_words_array.max
  end


end

test1 = Scrabble::Scoring.highest_score_from(["cat", "anchovy", "bob"])


puts test1
