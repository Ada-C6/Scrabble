module Scrabble
  class Player
    attr_reader :name
    attr_accessor :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      @plays << word
    end

    def plays
      return @plays
    end


  end
end
