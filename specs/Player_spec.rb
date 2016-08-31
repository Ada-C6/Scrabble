require_relative 'spec_helper'
require_relative '../scrabble' # this is the module file
require_relative '../lib/scrabble_scoring'
require_relative '../lib/scrabble_player'

describe 'testing player class' do

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

  it 'Returns the highest scoring played word' do
    player = Scrabble::Player.new("sabrina4")
    player.play("zzzz")
    player.play("cat")
    player.play("boy")
    expect(player.highest_score_word.must_equal("zzzz"))
  end
  it 'Returns the score of the highest scoring word ' do
    player = Scrabble::Player.new("sabrina4")
    player.play("zzzz")
    player.play("cat")
    player.play("boy")
    expect(player.highest_word_score.must_equal(40))
  end

  it 'total_score method returns sum of scores of played words' do
    player = Scrabble::Player.new("sabrina5")
    player.play("knitting")
    player.play("oooooo")
    player.play("kitsch")
    expect(player.total_score.must_equal(84))
  end
end
