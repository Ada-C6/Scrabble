# STUCK? Did you remember to .self the method?

require_relative '../Scrabble.rb'

class Scrabble::Scoring

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
    puts "\n#{@word} scores #{@score} points\n\n"
    return @score
  end

  def self.start_word(word)
    raise ArgumentError unless word.class == String
    @word = word.upcase
    create_word_array(@word)
    @letters = @word.split(//)
    return @word
  end

  def self.create_word_array(word)
    @word_array = []
    @word_array << word
  end

  # def self.points
  #   @word_hash = {}
  #   @word_hash[:@score] => @word
  #
  #
  # end

  def self.score_highest(word_array)
  end

  def self.tie(a,b)
  end

end

puts tst = Scrabble::Scoring.start_word('potato')
