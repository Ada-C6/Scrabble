require_relative 'Spec_helper'

require_relative '../lib/Player'


describe Scrabble::Player do

# create a test that will check that you can get the name back
#1
  it 'Makes sure you can call name correctly' do
    player1 = Scrabble::Player.new("Michael Jordan")
    expect(player1.name).must_equal("Michael Jordan")
  end
#2
  it 'Returns array of words played by player' do
    player1 = Scrabble::Player.new("Michael Jordan")
    player1.play("hat")
    player1.play("dog")
    player1.play("cat")
    expect(player1.plays).must_equal(["hat", "dog", "cat" ])
  end
#3
  it 'Returns the score of the word' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    expect(player1.play("fuzz")).must_equal(25)
  end
#4
  it 'Returns the score of the 7-letter word' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    player1.play("sizzles")
    expect(player1.play("sizzles")).must_equal(75)
  end
#5
  it 'Returns sum of scores of played words' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    player1.play("fuzz")
    player1.play("dog")
    player1.play("cat")
    expect(player1.total_score).must_equal(35)
  end
#6
  it 'Returns sum of scores of played words with 7-letter word included' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    player1.play("sizzles")
    player1.play("fuzz")
    player1.play("dog")
    player1.play("cat")
    expect(player1.total_score).must_equal(110)
  end
#7
  it 'If the player has under 100 points, returns false' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    # dog = 5, cat = 5 , kitten = 10
    player1.play("kitten")
    player1.play("dog")
    player1.play("cat")
    player1.total_score
    expect(player1.won?).must_equal(false)
  end
#8
  it 'If the player has over 100 points, returns true' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    # dog = 5, cat = 5 , kitten = 10
    player1.play("kitten")
    player1.play("dog")
    player1.play("cat")
    player1.play("quiz")
    player1.play("quit")
    player1.play("quilt")
    player1.play("exit")
    player1.play("exited")
    player1.play("hit")
    player1.total_score
# dog = 5, cat = 5 , kitten = 10, quiz = 22, quit = 13, quilt = 14, exit = 11 exited = 14 hit = 6 total: 100
    expect(player1.won?).must_equal(true)
  end
#9
  it 'If the player has over 101 points, returns true, otherwise returns false' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    player1.play("kitten")
    player1.play("dog")
    player1.play("cat")
    player1.play("quiz")
    player1.play("quit")
    player1.play("quilt")
    player1.play("exit")
    player1.play("exited")
    player1.play("hits")
    player1.total_score
    # dog = 5, cat = 5 , kitten = 10, quiz = 22, quit = 13, quilt = 14, exit = 11 exited = 14 hits = 7 total: 10`
    expect(player1.won?).must_equal(true)
  end
#10
  it 'Do tiles and draw_tiles methods appropriately subtract from tile bag /tiles remaining category.' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    tilebag1 = Scrabble::TileBag.new
    player1.play("Cat")
    player1.draw_tiles(3)
    expect(tilebag1.tiles_remaining).must_equal(90)
  end
#11
  it 'Test Player can draw 7 tiles' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    tilebag1 = Scrabble::TileBag.new
    picked_tiles = player1.draw_tiles(tilebag1)
    player1.play("absent") # player plays 6 letter word.
    picked_tiles = player1.draw_tiles(6) # grabs 6 more.
    expect(picked_tiles.length).must_equal(7)
  end
#12
  it 'Ensure player starts with a set of 7 tiles.' do
    player1 = Scrabble::Player.new("Frida Kahlo")
    tilebag1 = Scrabble::TileBag.new
    picked_tiles = player1.draw_tiles(tilebag1)
    expect(picked_tiles.length).must_equal(7)
  end

end
