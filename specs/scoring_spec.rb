require_relative 'spec_helper' #get all the stuff we need for testing.
require_relative '../scoring.rb' #include all the code in scoring.rb that we need to test.

module Scrabble
  #Since all the tests in this spec correspond to Scoring, which lives inside Scrabble, can wrap the tests in the module also.
  describe Scoring do
    describe "#initialize" do
      it "should make a new instance of Scoring" do
        #this is testing that you can create a new instance of the Scoring class
        Scoring.new.must_be_instance_of(Scoring)
      end
    end

    describe "class" do
      it "should have a LETTER_SCORE length of 26" do
        #this just tests that the LETTER_SCORE data store has the correct length.
        Scoring::LETTER_SCORE.length.must_equal(26)
      end

      letters = ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
      letters.each do |letter|
        it "should have the correct LETTER_SCORE for a letter" do
        #Spot-check the constant LETTER_SCORE for correct letter score.
        Scoring::LETTER_SCORE[letter].must_equal 1
        end
      end
    end

    describe "score" do
      it "should raise an error when a non-string is passed in" do
        #I want to check that if we pass something that isn't a string in, that it doesn't try to score it.
        #TODO: We could also add tests to make sure that the thing that is passed into the score method are single words (no spaces).
        proc {Scoring.score(1)}.must_raise(ArgumentError)
      end
      it "should strip punctuation when a non-alpha character is input" do
        Scoring.score("ETHOS!").must_equal(Scoring.score("ETHOS"))
      end

      it "should have a score method that takes in a word" do
        # From the requirements: self.score(word): returns the total score value for the given word. The word is input as a string (case insensitive). The chart in the baseline requirements shows the point value for a given letter.
        Scoring.score("cat")
      end

      it "score method should return the correct score" do
        # This test will input a specific word with a known score, assert equal that the score the method returns is the same.
        word = "CAT"
        Scoring.score(word).must_equal(5)
      end

      it "score method should add 50 points to a 7 letter word" do
        # From the requirements: A seven letter word means that a player used all the tiles. Seven letter words receive a 50 point bonus.
        word = "aarrghh"
        Scoring.score(word).must_equal(64)
      end

      it "score method should be case insensitive" do
        # self.score(word): returns the total score value for the given word. The word is input as a string (case insensitive). The chart in the baseline requirements shows the point value for a given letter.
        weird_word = "KiTTeN"
        word = "kitten"
        Scoring.score(weird_word).must_be_same_as(Scoring.score(word))
      end

      it "score method should call strip_punctuation and strip it" do
        #The score method calls strip_punctuation and returns the word without any punctuation, so that if any punctuation is entered into the word, it scores it without the extra characters.
        Scoring.score("this!").must_be_same_as(Scoring.score("this"))
      end
    end

    describe "highest_score_from" do
      it "should have a highest_score_from method that takes in an array of words" do
        # From the requirements: self.highest_score_from(array_of_words): returns the word in the array with the highest score.
        # This tests that the method exists and takes in the right number of arguments.
        array_of_words = %w(CAT HAT GRAPE)
        Scoring.highest_score_from(array_of_words)
      end

      it "should have a highest_score_from method that takes in an array of words" do
        # From the requirements: self.highest_score_from(array_of_words): returns the word in the array with the highest score.
        # This tests that the correct word is returned.
        array_of_words = %w(CAT HAT GRAPE)
        Scoring.highest_score_from(array_of_words).must_equal("GRAPE")
      end

      it "highest_score_from should return the smaller of two words with the same score" do
        # From the requirements: It’s better to use fewer tiles, in the case of a tie, prefer the work with the fewest letters.
        # HATTER and MEOW are both 9 point words, but have different lengths.
        same_score = %w(HATTER MEOW CAT)
        Scoring.highest_score_from(same_score).must_equal("MEOW")
      end

      it "highest_score_from returns seven letter word even if there's shorter higher score word" do
        # From the requirements: There is a bonus for words that are seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
        #NOTE: the shorter word here is not real, but has the same score as the seven letter word (which includes the 50 point bonus).
        seven_vs = %w(QZQZZX aerated)
        Scoring.highest_score_from(seven_vs).must_equal("aerated")
      end

      it "highest score method returns first word if there's a tie in score/length" do
        # From the requirements: If the there are multiple words that are the same score and same length, pick the first one in the supplied list.
        # TOMCAT and KITTEN are both 6 letters long, and both have scores of 10. TOMCAT appears first, so that should be returned.
        same_length = %w(FOOT TOMCAT KITTEN)
        Scoring.highest_score_from(same_length).must_equal("TOMCAT")
      end
    end
  end
end
