# STUCK? Did you remember to .self the method?

require_relative '../Scrabble.rb'

class Scrabble::Scoring

  @@word_array = []
  @@word_hash = {}
  @@winner = ["", 0]

  LETTER_SCORES = {"A"=>1, "B"=>3, "C"=>3, "D"=>2,
   "E"=>1, "F"=>4, "G"=>2, "H"=>4,
   "I"=>1, "J"=>8, "K"=>5, "L"=>1,
   "M"=>3, "N"=>1, "O"=>1, "P"=>3,
   "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
   "U"=>1, "V"=>4, "W"=>4, "X"=>8,
   "Y"=>4, "Z"=>10}

  def self.score(word)
    start_word(word)
    @word.length == 7 ? @score = 50 : @score = 0

    @letters.each do |char|
    @score += LETTER_SCORES[char]
    end
    # hash(@word, @score)
    # puts "\n#{@word} scores #{@score} points\n\n"
    return @score
  end

  def self.start_word(word)
    raise ArgumentError unless word.class == String
    @word = word.upcase
    @@word_array << @word
    @letters = @word.split(//)
    return @word
  end

  # def self.hash(word, score)
  #   @@word_hash[word] = score
  #   # print @@word_hash
  #   # @@word_hash.each { |k, v| puts k if v == @@word_hash.values.max }
  #   score_highest(@@word_hash)
  # end

  def self.score_highest(word_array)
    if @score >= @@winner[1]
      set_tie_winner(@word, @score)
    end

    @@word_array.each do |word|

    end


    # @@word_hash.each { |k, v| print k if v == @@word_hash.values.max }
    # if two words are tied
    #     @@word_array << k
    #   self.tie(@@word_array)
    # end
  end

  def self.set_tie_winner(word, score)
    if score > @@winner[1]
      @@winner = [word, score]
    else
      if word.length == 7 || @@winner[0].length == 7
        if word.length == @@winner[0].length
          return @@winner
        else
          @@winner = [word, score]
        end
      elsif @@winner[0].length < word.length
        return @@winner
      else
        @@winner = [word, score]
      end
    end



  end

#   def self.tie(word_array)
#     word_lengths = []
#     word_array.each do |word|
#       word_lengths << word.length
#     end
#     #  p word_array[word_lengths.index(7)]
#     if word_lengths.include?(7)
#       return @@word_array[word_lengths.index(7)]
#     elsif
#       return @@word_array[word_lengths.index(word_lengths.min)]
#     else
#       return @@word_array[0]
#     end
#   end
#
#
end

print tst6 =Scrabble::Scoring.set_tie_winner("ROASTED", 9)

# print tst7 =Scrabble::Scoring.set_tie_winner("MAJESTY", 69)

# print tst8 =Scrabble::Scoring.set_tie_winner("ROASTED", 9)

# puts tst5 = Scrabble::Scoring.tie(["ROASTED", "ACHE"])

# tst1 = Scrabble::Scoring.score('majesty')
#
# tst2 = Scrabble::Scoring.score('potato')

# tst3 = Scrabble::Scoring.score('apple')

# tst4 = Scrabble::Scoring.score('hello')
