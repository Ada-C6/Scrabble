require_relative "scoring"

module Scrabble
  class Player

    attr_reader :name, :winner, :words_played

    def initialize(name)
      @name = name
      @words_played = []
      @winner = false
    end

    def plays
      return @words_played
    end

    def play(word)
      if @winner == true
        return false
      end
      word_score = Scoring.score(word) #return score
      @words_played << word
      return word_score
    end

    def total_score
      player_score = 0
      plays.each do |word|
        current_score = Scoring.score(word)
        player_score += current_score
      end
      return player_score
    end

  end







end
