require_relative '../scrabble.rb'
require_relative 'scrabble_scoring.rb'
class Scrabble::Player
  attr_reader :name, :plays

  def initialize(name)
    @name = name
    @plays = []
  end

  def play(word)
    @plays << word
    score = Scrabble::Scoring.score(word)
    return score
  end

end # end of class
