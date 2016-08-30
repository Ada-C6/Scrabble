require_relative 'spec_helper'
require_relative '../scoring'

	describe Scrabble::Scoring do
		it "should have a constant equal to a hash" do
			Scrabble::Scoring::LETTERS.must_be_instance_of(Hash)
		end

		describe "self.score" do
			it "should take one argument only" do
				proc { Scrabble::Scoring.score }.must_raise ArgumentError
			end



		end

	end
