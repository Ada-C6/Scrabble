module Scrabble
  class Dictionary
    attr_accessor :DICTIONARY
    DICTIONARY = %w(ZOO POODLE KARI AND CRAZY BOTTLE POPPIN SALSA)


    def self.word_valid?(word)
      if !word.include?(" ")
        if DICTIONARY.include?(word.upcase)
        return true
        else
          return false
        end
      else
        raise ArgumentError.new "That's not a valid word."
      end
    end

  end
end
