require_relative 'spec_helper'
require_relative '../scrabble' # this is the module file
require_relative '../lib/scrabble_scoring'
require_relative '../lib/scrabble_player'

describe 'testing player class' do

  before do

  end

  it 'returns the value of the @name instance variable' do
    player = Scrabble::Player.new("sabrina")
    expect(player.name.must_equal("sabrina"))
  end

  it 'play(word) method returns the score of word' do
    player = Scrabble::Player.new("sabrina2")
    expect(player.play("zoo").must_equal(12))
  end

  it 'play(word) adds word to plays array' do
    player = Scrabble::Player.new("sabrina3")
    player.play("zoo")
    expect(player.plays.must_include("zoo"))
  end

  # it 'returns an Array of the words played by the player' do
  #   expect(Scrabble::Player.play(["sabrina", "cat", "Boxer"]).must_equal(["sabrina", "cat", "Boxer"]))
  # end

end
