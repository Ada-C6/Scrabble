module Scrabble
  class Scoring
    attr_accessor :array_of_words, :word
    attr_reader

    # SCORE_CHART = {
    #   1: ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    #   2: ["D", "G"],
    #   3: ["B", "C", "M", "P"],
    #   4: ["F", "H", "V", "W", "Y"],
    #   5: ["K"],
    #   8: ["J", "X"],
    #   10: ["Q", "Z"]
    # }

    # @array_of_words = []
    #
    def initialize(word)
      @word = word
      # @array_of_words << word
    end


    # def self.score
    # end
    #
    # def self.highest_score_from_array(array_of_words)
    # end

  end
end
