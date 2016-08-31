require_relative '../scrabble.rb'
require_relative 'scrabble_scoring.rb'
class Scrabble::Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
