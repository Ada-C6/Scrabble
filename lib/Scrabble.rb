# Hint from Chris raise ArgumentError unless number.class == Fixnum


require_relative '../Scrabble.rb'

class Scrabble::Scoring

  attr_reader :word, :points, :word_array, :letter_scores
  @word_array = []

  def self.letters
    @letter_scores = {"A"=>1, "B"=>3, "C"=>3, "D"=>2,
   "E"=>1, "F"=>4, "G"=>2, "H"=>4,
   "I"=>1, "J"=>8, "K"=>5, "L"=>1,
   "M"=>3, "N"=>1, "O"=>1, "P"=>3,
   "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
   "U"=>1, "V"=>4, "W"=>4, "X"=>8,
   "Y"=>4, "Z"=>10}
  end

  def self.score(word)

      raise ArgumentError unless word.class == String
      word.upcase
        word.split(//).each do |char|
          p char
        end
        print word.split(//)
  end

  def self.points
  end

  def self.score_highest(word_array)
  end

  def self.tie(a,b)
  end

end

tst = Scrabble::Scoring.score('potato')
