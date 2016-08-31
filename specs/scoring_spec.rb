require_relative 'spec_helper'
require_relative '../scoring'

known_words = {
	"farm" => 9, # 4,1,1,3
	"cat" => 5, # 3,1,1
	"ferrets" => 60, # 50 + 4,1,1,1,1,1,1
}

test_words = ["farm", "cat", "ferrets"]

#create test array with tied score words with different lengths,
#one with seven

tied_scores = ["zoos", "hex", "kittys"]

tied_scores_seven = ["staring", "zzzzzx"]

tied_scores_same_len = ["hex", "fox", "kittys", "zoos", "wix"]

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

	describe "self.highest_score_from" do

		it "should raise an error when non-array is passed in" do
			proc{ Scrabble::Scoring.highest_score_from({}) }.must_raise(ArgumentError)
		end

		it "must return the word with the highest score" do
				Scrabble::Scoring.highest_score_from(test_words).must_equal("ferrets")

		end

		#separate tests with each tie breaker

		it "should return the word with the fewest letters in case of tie" do
			Scrabble::Scoring.highest_score_from(tied_scores).must_equal("hex")
		end

		it "should return a seven-letter word in case of a tie" do
			Scrabble::Scoring.highest_score_from(tied_scores_seven).must_equal("staring")
		end

		it "should return the first word if all winning words are the same length" do
			Scrabble::Scoring.highest_score_from(tied_scores_same_len).must_equal("hex")
		end

	end

end
