require_relative '../scrabble.rb'

class Scoring

  def self.score(word)
    letter_array = word.upcase.split('')
    score = 0

    # go through each item in the letter array
    # convert it to a symbol
    # get the symbol (the key)'s value from the hash constant
    # add that value to the score
    letter_array.each do |letter|
      score += Scrabble::SCORE_HASH[letter.to_sym]
    end
    return score
  end


end


# puts Scoring.score("hello")
