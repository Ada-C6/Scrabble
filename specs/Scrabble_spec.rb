require_relative '../lib/Scrabble.rb'
require_relative 'spec_helper.rb'

describe "Testing Scrabble" do

  it "It must raise an ArgumentError if given a Fixnum" do
      # expect(Scrabble::Scoring.score(word)).must_equal("HELLO")
       expect (proc { Scrabble::Scoring.score(11)} ).must_raise ArgumentError
    #  expect (proc { Scrabble::Scrabble.score(Fixnum)} ).must_raise ArgumentError

  end
  # it "Testing for cases divisible by 3 and not 5" do
  #     expect(FizzBuzz::Fizzbuzz.fizzbuzz(3)).must_equal("Fizz")
  #     expect(FizzBuzz::Fizzbuzz.fizzbuzz(6)).must_equal("Fizz")
  #     expect(FizzBuzz::Fizzbuzz.fizzbuzz(9)).must_equal("Fizz")
  # end

  it "Testing to remove case sensitivity" do
      expect(Scrabble::Scoring.score("HeLLo")  ).must_equal("HELLO")
  end

  it "Testing to make sure score is correct" do
      expect(Scrabble::Scoring.score("potato")  ).must_equal(8)
  end
end
