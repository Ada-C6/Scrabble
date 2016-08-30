require_relative 'spec_helper'
require_relative '../scoring'

known_words = {
	"word" => 8, # 4,1,1,2
	"cat" => 5, # 3,1,1
	"ferrets" => 60, # 50 + 4,1,1,1,1,1,1
}

describe Scrabble::Scoring do
	it "should have a constant equal to a hash" do
		Scrabble::Scoring::LETTERS.must_be_instance_of(Hash)
	end

	describe "self.score" do
		it "must correctly score known words" do
			known_words.each do |word, expected_score|
				Scrabble::Scoring.score(word).must_equal(expected_score)
			end
		end

		it "must not have an empty string argument" do
			proc { Scrabble::Scoring.score("") }.must_raise(ArgumentError)
		end

		# write assertion for words greater than 7
	end

end
