module Scrabble
  class Player
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def plays(word)
      @words_played = []
      @words_played << word
      return @words_played
    end

  end
end
