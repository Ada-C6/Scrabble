require_relative 'scoring'
module Scrabble
  class Player
    attr_reader :name
    attr_accessor :plays, :total, :highest_word

    def initialize(name)
      @name = name
      @plays = []
      @total = 0
      @highest_word = ""
    end

    def play(word)
      @plays << word
      word_score = Scrabble::Scoring.score(word)
      @total += word_score
      if won?
        return false
      else
        return word_score
      end
    end

    def total_score
      return @total
    end

    def won?
      if @total > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      @highest_word = Scrabble::Scoring.highest_score_from(@plays)
      return @highest_word
    end

    def highest_word_score
      highest_word = highest_scoring_word
      highest_score = Scrabble::Scoring.score(highest_word)
      return highest_score
    end
  end
end


# p= Scrabble::Player.new("hello")
# p.play
# p.plays = ["car", "birdand", "home"]
# puts p.highest_scoring_word
# puts p.highest_word_score
