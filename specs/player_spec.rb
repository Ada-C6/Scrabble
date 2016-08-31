# test for Player class

require_relative '../player'
require_relative 'spec_helper'


describe Scrabble::Player do
    describe "#initialize" do
        it "must be an instance of the Player class" do
            Scrabble::Player.new("Jasper").must_be_instance_of(Scrabble::Player)
        end

        it "should have the same value that we set" do
            new_player = Scrabble::Player.new("Jasper")
            new_player.name.must_equal("Jasper")
        end

        it "should raise an error if a non-string parameter input is passed in" do
            proc {Scrabble::Player.new(123)}.must_raise(ArgumentError)
        end
    end
end
