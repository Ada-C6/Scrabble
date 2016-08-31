require_relative 'spec_helper'
require_relative '../scrabble' # this is the module file
require_relative '../lib/scrabble_scoring'
require_relative '../lib/scrabble_player'

describe 'testing player class' do

  it 'returns the value of the @name instance variable' do
    player = Scrabble::Player.new("sabrina")
    expect(player.name.must_equal("sabrina"))
  end

  it 'player must be initialized with a string for a name' do
    # expecting if we try to init a Player with anything other than a string for a name, it should raise an error
    expect( proc { player = Scrabble::Player.new(:sabrina) } ).must_raise(ArgumentError)
  end

  it 'play(word) method returns the score of word' do
    player = Scrabble::Player.new("sabrina2")
    expect(player.play("zoo").must_equal(12))
  end

  it 'play(word) must return a fixnum' do
    player = Scrabble::Player.new("laurenCat")
    expect(player.play("something").must_be_instance_of(Fixnum))
  end

  it 'play(word) adds word to plays array' do
    player = Scrabble::Player.new("sabrina3")
    player.play("zoo")
    expect(player.plays.must_include("zoo"))
  end

  it 'play(word) returns false if player has already won' do
    player = Scrabble::Player.new("lauren0007")
    player.play("zzzzzzz")
    expect(player.play("anotherword").must_equal(false))
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

  it 'won should return true if player has over 100 points' do
    player = Scrabble::Player.new("Lauren5")
    player.play("knitting")
    player.play("oooooo")
    player.play("kitsch")
    player.play("zz")
    expect(player.won?.must_equal(true))
  end

  it 'won should return false if player has less than 100 points' do
    player = Scrabble::Player.new("Lauren5")
    player.play("knitting")
    player.play("oooooo")
    player.play("kitsch")
    expect(player.won?.must_equal(false))
  end
end#end of test
