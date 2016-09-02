require_relative '../Scrabble.rb'
require_relative 'Scrabble.rb'
require_relative 'Player.rb'

class Scrabble::Scoring

  LETTER_SCORES = {"A"=>1, "B"=>3, "C"=>3, "D"=>2,
   "E"=>1, "F"=>4, "G"=>2, "H"=>4,
   "I"=>1, "J"=>8, "K"=>5, "L"=>1,
   "M"=>3, "N"=>1, "O"=>1, "P"=>3,
   "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
   "U"=>1, "V"=>4, "W"=>4, "X"=>8,
   "Y"=>4, "Z"=>10}


   def self.capitalize_word(word)
     raise ArgumentError unless word.class == String
     word = word.upcase!
     return word
   end


  def self.score(word)
    capitalize_word(word)
    word.length == 7 ? score = 50 : score = 0
    letters = word.split(//)
    letters.each do |char|
      score += LETTER_SCORES[char]
    end
    return score
  end


  def self.score_highest(word_array)
    highest_score = ["", 0]

    word_array.each do |word|
      if score(word) > highest_score[1]
        highest_score = [word, score(word)]
      elsif highest_score[1] == score(word)
        highest_score = tie_breaker(highest_score, [word, score(word)])
      end
    end
    return highest_score[0]
  end


  def self.tie_breaker(pair1, pair2)
    if pair1[0].length != 7 && pair2[0].length != 7

      if pair1[0].length < pair2[0].length
        return pair1
      elsif pair1[0].length > pair2[0].length
        return pair2
      else
        return pair1
      end

    elsif pair1[0].length == 7 || pair2[0].length == 7
      if pair1[0].length == 7 && pair2[0].length == 7
        return pair1

      elsif pair1[0].length ==7
        return pair1

      else
        return pair2
      end
    end
  end

end
