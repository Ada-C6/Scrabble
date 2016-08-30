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

	#	it "should raise an error if there are any non-letter characters in a word" do
	#		proc { Scrabble::Scoring.score("1de") }.must_raise(ArgumentError)
	#	end

		it "must not have an empty string argument" do
			proc { Scrabble::Scoring.score("") }.must_raise(ArgumentError)
		end

		it "must not take an argument greater than 7 letters" do
			proc {Scrabble::Scoring.score("caterpillar")}.must_raise(ArgumentError)
		end
	end

end
