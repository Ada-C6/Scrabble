require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do
	it "should have a constant equal to a hash" do
		Scrabble::Scoring::LETTERS.must_be_instance_of(Hash)
	end

	describe "self.score" do
		it "must correctly score known words" do
			known_words = {
				"farm" => 9, # 4,1,1,3
				"cat" => 5, # 3,1,1
				"ferrets" => 60, # 50 + 4,1,1,1,1,1,1
			}

			known_words.each do |word, expected_score|
				Scrabble::Scoring.score(word).must_equal(expected_score)
			end
		end

		it "should raise an error if there are any non-letter characters in a word" do
			invalid_chars = ["1de", "cat! 2", "com,ma"]
			invalid_chars.each do |word|
				proc { Scrabble::Scoring.score(word) }.must_raise(ArgumentError)
			end
		end

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
				highest_score_array = ["farm", "cat", "ferrets"]
				Scrabble::Scoring.highest_score_from(highest_score_array).must_equal("ferrets")
		end

		it "should return the word with the fewest letters in case of tie" do
			tied_scores = ["zoos", "hex", "kittys"]
			Scrabble::Scoring.highest_score_from(tied_scores).must_equal("hex")
		end

		it "should return a seven-letter word in case of a tie" do
			tied_scores_seven = ["staring", "zzzzzx", "cat"]
			Scrabble::Scoring.highest_score_from(tied_scores_seven).must_equal("staring")
		end

		it "should return the first word if all winning words are the same length" do
			same_len_tied = ["hex", "fox", "kittys", "zoos", "wix"]
			Scrabble::Scoring.highest_score_from(same_len_tied).must_equal("hex")
		end

	end

end
