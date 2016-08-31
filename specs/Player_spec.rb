require_relative 'spec_helper'
require_relative '../scrabble' # this is the module file
require_relative '../lib/scrabble_scoring'
require_relative '../lib/scrabble_player'

player = Scrabble::Player.new("sabrina")
describe 'testing player class' do



  it 'returns the value of the @name instance variable' do
    expect(player.name.must_equal("sabrina"))

  end




  # it 'returns an Array of the words played by the player' do
  #   expect(Scrabble::Player.play(["sabrina", "cat", "Boxer"]).must_equal(["sabrina", "cat", "Boxer"]))
  # end

end
