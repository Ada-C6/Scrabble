require_relative '../scrabble.rb'

class Scrabble::Scoring

  def self.score(word)
    check_input(word)
    letter_array = word.upcase.split('')
    score = 0
    # this adds 50 if word length is >= 7 by calling bingo.
    score += bingo(word)

    # iterate through array and add score
    letter_array.each do |letter|
      score += Scrabble::SCORE_HASH[letter.to_sym]
    end
    return score
  end


  def self.bingo(word)
    if word.length >= 7
      return 50
    else
      return 0
    end
  end

  # this is not ready to go
  def self.check_input(word)

    raise ArgumentError unless word.class == String

    if word =~ /^[a-zA-Z]+$/
    return word
    else
     raise ArgumentError
    end
  end

end


puts Scrabble::Scoring.score("a")
