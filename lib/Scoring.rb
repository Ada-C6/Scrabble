#1 Create data structure to store individual letter scores - make a CONSTANT in module - DONE

#2 Create Spec file - DONE

#3 Create one red test in Spec file - DONE!

#4 Execute one test - Rake from project root DONE!

#_________________________

#5 create Scrabble::Scoring class with min of 8 specs (from Spec file) - DONE

#6 Include the following methods
#a. self.score(word) - return total score for word. Word is input as string (case insensitive). - DONE
#b. self.highest_score_from(array_of_words)
#  - output is word in array with highest score
#  - in case of tie, use tie-breaking rules (better to use fewer tiles
#  - fewer tiles with same score wins)
#  - bonus for words of 7 letters - 50 pts. - DONE
#  - choose word with 7 letters over one with fewer tiles with same score
#  - same score/same length - first one in supplied list wins

require_relative "../module"

class Scrabble::Scoring

  attr_accessor :word, :total


  #   if word == nil || word == ""
  #     raise NameError.new("You must enter a string")
  #   end
  # end

  ## if word.empty || word.nil
  ##   puts "Enter a string, damnit!"
  ## end
  ##  NameError: uninitialized constant Scoring

#   if word != String && @word != ""
#     raise NameError.new("You must enter a string")
#   end
# end


  # create an array of strings (letters) from word
  # loop through letters array in order to determine total score (by referencing LETTER_HASH)

  def self.score(word)

    return 0 if word.nil? || word.empty?

    letters = word.upcase.split('')

    letters.length >= 7 ? total = 50 : total = 0

    letters.each do |letter|
      total += Scrabble::LETTER_HASH[letter]
    end

    return total

  end

  def self.highest_score_from(array_of_words)
    #SEE NOTES
    max_score = 0
    max_scoring_word = ""

    array_of_words.each do |word|
      if score(word).to_i > max_score # bang method? shal it work?
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


# same length, same score.
# test1 = Scrabble::Scoring.highest_score_from([["sizzles", "fuzz", "dog", "cat"])
# #
# #
# puts test1
