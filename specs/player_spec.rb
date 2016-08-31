require_relative 'Spec_helper'

require_relative '../lib/Player'


describe Scrabble::Player do

  it 'Returns array of words played by player' do
    player1 = Scrabble::Player.new("Michael Jordan")
    player1.play("hat")
    player1.play("dog")
    player1.play("cat")
    expect(player1.plays).must_equal(["hat", "dog", "cat" ])
  end

  it 'Returns the score of the word' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    expect(player1.play("fuzz")).must_equal(25)
  end

  it 'Returns the score of the 7-letter word' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    player1.play("sizzles")
    expect(player1.play("sizzles")).must_equal(75)
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
    player1 = Scrabble::Player.new("Frida Kahlo")
    player1.total_score(["sizzles", "fuzz", "dog", "cat"])
    expect(Scrabble::Player.new(["sizzles", "fuzz", "dog", "cat"]).total_score).must_equal(110)
  end

  it 'If the player has under 100 points, returns false' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    # dog = 5, cat = 5 , kitten = 10
    player1.total_score(["kitten", "cat", "dog"])
    expect(Scrabble::Player.new(20).win?).must_equal(false)
  end

  it 'If the player has over 100 points, returns true, otherwise returns false' do
    player1 = Scrabble::Player.new("Frida Kahlo")
# dog = 5, cat = 5 , kitten = 10, quiz = 22, quit = 13, quilt = 14, exit = 11 exited = 14 hit = 6 total: 100
    player1.total_score(["dog","cat", "kitten", "quiz","quit" "quilt", "exit", "exited", "hit"])
    expect(Scrabble::Player.new(100).win?).must_equal(true)
  end

  it 'If the player has over 101 points, returns true, otherwise returns false' do
    player1 = Scrabble::Player.new("Frida Kahlo")
# dog = 5, cat = 5 , kitten = 10, quiz = 22, quit = 13, quilt = 14, exit = 11 exited = 14 hit = 6 total: 100
    player1.total_score(["dog","cat", "kitten", "quiz","quit" "quilt", "exit", "exited", "hits"])
    expect(Scrabble::Player.new(101).win?).must_equal(true)
  end

  it 'Returns the highest scoring played word' do
    expect(Scrabble::Player.new(["biz","quasi", "cat", "milk"]).highest_scoring_word).must_equal("biz")
  end

    it 'Returns the highest score, of the highest scoring word.' do
# biz = 14, quasi = 14, cat = 5, milk = 10
      expect(Scrabble::Player.new(["biz","quasi", "cat", "milk"]).win?).highest_word_score(14)
    end

end
