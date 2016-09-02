# STUCK? Did you remember to .self the method?
#STUCK STILL?? Check the class!!!

require_relative '../Scrabble.rb'

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


class Scrabble::Player

  attr_reader :name, :player_words

  def initialize(name)

    raise ArgumentError unless name.class == String
    @name = name
    @player_words = []
  end

  def plays
    return @player_words
  end

  def play(word)
    if won? == true
      puts "You have already won"
      return false
    else
      @player_words << word
      return Scrabble::Scoring.score(word)
    end
  end

  def total_score
    total_score = 0
    @player_words.each do |word|
      total_score += Scrabble::Scoring.score(word)
    end
    return total_score
  end

  def won?
     if total_score > 100 #calls the method
      return true
    else
      false
    end
  end

  def highest_scoring_word
    return Scrabble::Scoring.score_highest(@player_words)
  end

  def highest_word_score
    return Scrabble::Scoring.score(highest_scoring_word)
  end

end

class Scrabble::TileBag

  attr_reader :tile_bag

  def initialize

    @tile_bag = {"A"=>9, "B"=>2, "C"=>2, "D"=>4, "E"=>12, "F"=>2, "G"=>3, "H"=>2, "I"=>9, "J"=>1, "K"=>1, "L"=>4, "M"=>2, "N"=>6, "O"=>8, "P"=>2, "Q"=>1, "R"=>6, "S"=>4, "T"=>6, "U"=>4, "V"=>2, "W"=>2, "X"=>1,"Y"=>2, "Z"=>1}

     return @tile_bag
  end

  def draw_tiles(num)
    draw_tiles = []
    while num > 0
      tile = @tile_bag.keys.sample(1)[0]

      if @tile_bag[tile] != 0
         @tile_bag[tile] -= 1
        draw_tiles << tile
        num -= 1
      end
    end
    return draw_tiles
  end

  def tiles_remaining
    tiles_remaining = @tile_bag.values
    sum = tiles_remaining.inject {|sum, element| sum + element}
    return sum
  end

end

test1 = Scrabble::TileBag.new
# puts test1.draw_tiles(12)
print test1.tiles_remaining

# test1.play("potato")
# test1.play("apple")
# test1.play("majesty")
# test1.play("xylophone")
# puts test1.total_score
# puts test1.won?
