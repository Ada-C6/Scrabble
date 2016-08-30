require_relative 'spec_helper'
require_relative '../scrabble'

describe Scrabble do
	describe Scrabble::Scoring do
		it "should have a constant equal to a hash" do
			Scrabble::Scoring::LETTERS.must_be_instance_of(Hash)
		end
	end
end
