require_relative'Spec_helper'
require_relative '../lib/Scoring'
require_relative '../lib/Player'
require_relative '../lib/TileBag'

describe Scrabble::TileBag do
#1
  it 'Does tile bag have 100 tiles?' do
    tilebag1 = Scrabble::TileBag.new
    expect(tilebag1.tiles_remaining).must_equal(100)
  end
#2
  it 'Does draw tiles method return correct num of tiles?' do
    tilebag1 = Scrabble::TileBag.new
    picked_tiles = tilebag1.draw_tiles(5)
    expect(picked_tiles.length).must_equal(5)
  end
#3
  it 'After drawing 7 tiles, remaining tiles should = 93' do
    tilebag1 = Scrabble::TileBag.new
# how do we garuntee that these are random?
    tilebag1.draw_tiles(4)
    tilebag1.draw_tiles(2)
    tilebag1.draw_tiles(1)
    expect(tilebag1.tiles_remaining).must_equal(93)
  end
#4
  it "There is an error if you try to hold more than 7 letters in your tile bag" do
    tilebag1 = Scrabble::TileBag.new
    tilebag1.draw_tiles(6)
    # we can't have more than our alotted 7 tiles
    proc {tilebag1.draw_tiles(2)}.must_raise(ArgumentError)
  end
 # how do you test to see if error happens, if you aren't able to have more than 7 tiles?
 it "Raise error if player tries to draw more than 7" do
   tilebag1 = Scrabble::TileBag.new
   # we can't have more than our alotted 7 tiles
   # proc, we didn't know you. till we did!
   proc {tilebag1.draw_tiles(8)}.must_raise(ArgumentError)
 end

 it "Raise error if player tries to draw tiles when none are left. " do
  player1 = Scrabble::Player.new("Frida Kahlo")
  tilebag1 = Scrabble::TileBag.new
  player1.draw_tiles(tilebag1)
  current_tiles = player1.tiles
  # 1
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)

  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  # 2
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  # 3
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #4
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #5
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #6
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #7
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #8
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #9
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #9
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #10
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #11
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #12
  player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  player1.draw_tiles(7)
  #13
  # player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
  # player1.draw_tiles(7)
  #14

   proc {player1.play(current_tiles[0] + current_tiles[1] + current_tiles[2] + current_tiles[3] + current_tiles[4] + current_tiles[5] + current_tiles[6])
   player1.draw_tiles(7)}.must_raise(ArgumentError)
 end
 # tilebag1.draw_tiles(7)
 # player1.play(word[1][2])


end
