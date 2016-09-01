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

  # this determines whether the word uses all 7 tiles
  def self.bingo(word)
    if word.length >= 7
      return 50 # this adds the 50 points
    else
      return 0 # if not, then add 0 points
    end
  end


  def self.check_input(word)
    # this will only allow the word to be a string
    raise ArgumentError unless word.class == String

    # this checks to be sure the word only contains letters
    if word =~ /^[a-zA-Z]+$/
    return word
    else
     raise ArgumentError
    end
  end

  # this method finds the highest score from an array of words
  def self.highest_score_from(array_of_words)
    # make sure the argument is an array
    raise ArgumentError unless array_of_words.class == Array

    word_hash = {}

    array_of_words.each do |element|
      word_hash[element] = score(element)
    end

    if !determine_tie(word_hash)
      # this returns the word that has the highest score if there is no tie.
      return word_hash.key(word_hash.values.max)
    else
      tie(word_hash)
    end

  end

  def self.determine_tie(hash)
    # determines if there are any ties.
    if hash.values.length != hash.values.uniq.length
      return true
    else
      return false
    end
  end

  def self.tie(word_hash)
    # make an empty array, will be made of the words that are tied
    tie_words = []
    # iterates through hash and adds word to the array if the value is one of the max values
    word_hash.each { |key, value| tie_words << key if value == word_hash.values.max }
    winner = tiebreaker(tie_words)
    return winner
  end

  def self.tiebreaker(tie_array)
    #returns winning word if words are same length.
    two_d_array = []
    tie_array.each do |word|
      two_d_array << [word, word.length]
    end
    max = 7
    new_array = two_d_array.select {|word| word[1] >= max}
    if new_array.length == 0
      find_winner_non7(tie_array)
    else
      return new_array[0][0] # returns the first word played has 7 or greater letters
    end
  end

  def self.find_winner_non7(tie_array)
    winning_word = ""
    winning_length = 10000
    tie_array.each do |word|
      if word.length < winning_length
        winning_length = word.length
        winning_word = word
      end
    end
    return winning_word
  end


end # end of Scoring class
# 
# puts Scrabble::Scoring.tiebreaker(["sabrina", "knitting"])
