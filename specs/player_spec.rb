require_relative 'spec_helper'
require_relative '../player'

describe Scrabble::Player do
    describe "#initialize" do
        let(:player_test) {Scrabble::Player.new("Sally")}

        it "can create a new instance of Player" do
            player_test.must_be_instance_of(Scrabble::Player)
        end

        it "has a name" do
            Scrabble::Player.new("InuYasha").name.must_equal("InuYasha")
        end
    end
end
