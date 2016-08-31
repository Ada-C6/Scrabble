#require_relative "scoring"

module Scrabble
class Player

  attr_reader :name

  def initialize(name)
    @name = name
    @words_played = []
    #@winner = false
  end

  def plays
    return @words_played
  end

@todo don't start here

end







end
