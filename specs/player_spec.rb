require_relative 'Spec_helper'

require_relative '../lib/Player'


describe Scrabble::Player do

  it 'Returns array of words played by player' do
    player1 = Scrabble::Player.new("Michael Jordan")
    player1.play("hat")
    player1.play("dog")
    player1.play("cat")
    expect(Scrabble::Player.new(["hat", "dog", "cat" ]).plays).must_equal(["hat", "dog", "cat" ])
  end

  it 'Returns the score of the word' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    player1.play("fuzz")
    expect(Scrabble::Player.new(["fuzz"]).play).must_equal(25)
  end

  it 'Returns the score of the 7-letter word' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    player1.play("sizzles")
    expect(Scrabble::Player.new(["sizzles"]).play).must_equal(75)
  end

  it 'Returns sum of scores of played words' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    player1.total_score(["fuzz", "dog", "cat"])
    expect(Scrabble::Player.new(["fuzz", "dog", "cat"]).total_score).must_equal(35)
  end

  it 'Returns sum of scores of played words with 7-letter word included' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    player1.total_score(["sizzles", "fuzz", "dog", "cat"])
    expect(Scrabble::Player.new(["sizzles", "fuzz", "dog", "cat"]).total_score).must_equal(110)
  end

  it 'Returns sum of scores of played words' do
    expect(Scrabble::Player.new(["sizzles", "fuzz", "dog", "cat"]).total_score).must_equal(110)
  end

  it 'If the player has under 100 points, returns false' do
    expect(Scrabble::Player.new(75).win?).must_equal(false)
  end

  it 'If the player has over 100 points, returns true, otherwise returns false' do
    expect(Scrabble::Player.new(100).win?).must_equal(true)
  end

  it 'If the player has over 101 points, returns true, otherwise returns false' do
    expect(Scrabble::Player.new(101).win?).must_equal(true)
  end

  it 'Returns the highest scoring played word' do
    expect(Scrabble::Player.new(["biz","quasi", "cat", "milk"]).win?).must_equal("biz")
  end
end
