require_relative '../Scrabble.rb'
require_relative 'Scrabble.rb'
require_relative 'Scoring.rb'

class Scrabble::Player

  attr_reader :name, :player_words, :player_hand

  def initialize(name)

    raise ArgumentError unless name.class == String
    @name = name
    @player_words = []
    @player_hand = []
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

  def tiles
    return @player_hand
  end

  def draw_tiles(tile_bag)

    @player_hand << tile_bag.draw_tiles(7 - @player_hand.length)

    return @player_hand.flatten!

  end

end
