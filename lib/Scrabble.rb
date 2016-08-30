require_relative '../Scrabble.rb'

class Scrabble::Scoring

  attr_reader :LETTER_VALUE_ARRAY

  @@LETTER_VALUE_ARRAY = {
      ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]=>1,
      ["D", "G"]=>2,
      ["B", "C", "M", "P"]=>3,
      ["F", "H", "V", "W", "Y"]=>4,
      ["K"]=>5,
      ["J", "X"]=>8,
      ["Q", "Z"]=>10
    }


  def self.letter_check(input)
    @@LETTER_VALUE_ARRAY.each do |key, value|
      if key.include? input
        return value
      end
    end
  end

end
