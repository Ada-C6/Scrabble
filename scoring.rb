module Scrabble
  class Scoring
    #KNK: I think we should store the letter scores in a hash. We'll probably want to use the letters as the keys, and the scores as the values, as it sounds like we'll be looking up the value for each letter in the words we're scoring.
    LETTER_SCORE = {
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
      "Z" => 10,
    }

    def initialize
    end

    def self.validate(word)
      trouble = ArgumentError.new("Not Accepted :( TRY AGAIN!!!")
      if !word.is_a? String
        raise trouble
      elsif word.split(" ").size != 1
        raise trouble
      else
      word = word.gsub(/[^a-z\s]/i,'').upcase
      word = word.split(' ').first
      word.strip
      return word
      end
    end

    def self.score(word)
      #This method takes in a word and outputs a score based on the sum of its LETTER_SCORE.
      #If the thing that is passed in is not a string, should raise an argument.
      #check_valid_entry(word)
      #This method should not be case sensititve. The LETTER_SCORE keys are caps, so we should capitalize the word argument on input.
      #word_cap = word.upcase #included this in 'check_valid_entry'
      #word_sp = strip_punctuation(word_cap)
      #Then we split the word into an array of letters:
      word_sp = validate(word)
      word_array = word_sp.split(//)
      word_score = 0
      #Then we start looking up the scores, and adding them to a word_score variable.
      word_array.each do |letter|
        word_score += LETTER_SCORE[letter]
      end
      #If word is 7 letters long, add 50 point bonus.
      if word_array.length == 7
        word_score += 50
      end
      return word_score
    end

    def self.highest_score_from(array_of_words)

      #start by iterating over the array of words to generate a score hash.
      #the idea is that we'll have a hash where the key will be the score, and the value will be an array of words with that score.
      scores = {}
      array_of_words.each do |word|
        if scores.has_key?(score(word))
          scores[score(word)] << word
        else
          scores[score(word)] = [word]
        end
      end

      #then, we'll be able to generate a scores array from the keys of the hash, and find the max score.
      max_score = scores.keys.max
      #then, we'll be able to get the array of words associated with that max score.
      highest_score_words = scores[max_score]
      #if there's only one word in the array, return that word.
      if highest_score_words.length == 1
        return highest_score_words.first
      else
        # if there are more than than one word in that array, pick the shortest word.
        shortest_word = highest_score_words.first #start with the first word in the array
        highest_score_words.each do |word|
          #if there's a 7 letter word in the array associated with the max score, then pick that one. if there are multiple 7 letter words with the same score, return the first one.
          if word.length == 7
            return word #exits the loop and returns the word
          elsif word.length < shortest_word.length #compares length of word with first word
            shortest_word = word
            #if they're equal, don't do anything.
          end
        end
          return shortest_word
      end
    end
  end
end
