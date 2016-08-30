require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/Scrabble.rb'

describe "Testing Scrabble" do
  it "Testing for cases not divisible by 3 or 5" do
      expect(FizzBuzz::Fizzbuzz.fizzbuzz(1)).must_equal("1")
      expect(FizzBuzz::Fizzbuzz.fizzbuzz(2)).must_equal("2")
      expect(FizzBuzz::Fizzbuzz.fizzbuzz(4)).must_equal("4")
  end
  # it "Testing for cases divisible by 3 and not 5" do
  #     expect(FizzBuzz::Fizzbuzz.fizzbuzz(3)).must_equal("Fizz")
  #     expect(FizzBuzz::Fizzbuzz.fizzbuzz(6)).must_equal("Fizz")
  #     expect(FizzBuzz::Fizzbuzz.fizzbuzz(9)).must_equal("Fizz")
  # end
end
