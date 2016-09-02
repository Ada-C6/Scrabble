require_relative '../lib/Scrabble.rb'
require_relative 'spec_helper.rb'

describe "Testing Scrabble" do

  it "It must raise an ArgumentError if given a Fixnum" do
    expect (proc { Scrabble::Scoring.capitalize_word(11)} ).must_raise ArgumentError
  end

  it "Testing to remove case sensitivity" do
    expect(Scrabble::Scoring.capitalize_word("HeLLo")  ).must_equal("HELLO")
  end

  it "Testing to make sure score is correct" do
    expect(Scrabble::Scoring.score("potato")  ).must_equal(8)
  end

  it "Testing to make sure 7 tiles gets an extra 50 points" do
    expect(Scrabble::Scoring.score("majesty")  ).must_equal(69)
  end

  it "Testing to make sure the highest scoring word(s) are returned" do
    expect(Scrabble::Scoring.score_highest(["HELLO", "APPLE", "PET"])  ).must_equal("APPLE")
  end

  it "Testing to make sure tie returns word with exactly 7 characters - ROUND 1" do
    expect(Scrabble::Scoring.score_highest(["COASTED", "ZZZZZZ"])  ).must_equal("COASTED")
  end

  it "Testing to make sure tie returns word with exactly 7 characters - ROUND 2 swapped indices" do
    expect(Scrabble::Scoring.score_highest(["ZZZZZZ", "COASTED"])  ).must_equal("COASTED")
  end

  it "Testing to make sure tie returns first word if both are 7 letters long" do
    expect(Scrabble::Scoring.score_highest(["OOOOOOO", "AAAAAAA"])  ).must_equal("OOOOOOO")
  end

  it "Testing to make sure tie returns shorter word if neither are 7 letters long" do
    expect(Scrabble::Scoring.score_highest(["POTATO", "HELLO"])  ).must_equal("HELLO")
      expect(Scrabble::Scoring.score_highest(["POTATO", "HELLO"])  ).must_equal("HELLO")
  end

  it "Testing to make sure tie returns first word if words are same score and length and not 7 letters long" do
    expect(Scrabble::Scoring.score_highest(["IT", "AS", "IN"])  ).must_equal("IT")
  end


  ########## END OF WAVE 1 TESTS ##########


  it "It must raise an ArgumentError if name is given a non-String" do
    expect (proc { Scrabble::Player.initialize(333)} ).must_raise NoMethodError
  end

  it "Testing to make sure plays returns an array" do
    test1 = Scrabble::Player.new("Olivia")
    expect(test1.plays).must_equal([])
  end

  it "Testing to make sure play(word) adds the input word to the plays array" do
    test1 = Scrabble::Player.new("Olivia")
    test1.play("potato")
    test1.play("hello")
    expect(test1.plays  ).must_equal(["POTATO","HELLO"])
  end

  it "Testing to make sure play(word) returns false if player has already won" do
    test1 = Scrabble::Player.new("Olivia")
    test1.play("potato")
    test1.play("majesty")
    test1.play("xylophone")
    expect(test1.play("cheese")).must_equal(false)
  end

  it "Testing to make sure play(word) returns the word score if they haven't already won" do
    test1 = Scrabble::Player.new("Olivia")
    expect(test1.play("potato")  ).must_equal(8)
  end

  it "Testing to make sure total(score) returns the sum of the scores of played words" do
    test1 = Scrabble::Player.new("Olivia")
    test1.play("potato")
    test1.play("hello")
    expect(test1.total_score).must_equal(16)
  end

  it "Testing to make sure won works and returns false for less than 100 points" do
    test1 = Scrabble::Player.new("Olivia")
    test1.play("potato")
    test1.play("apple")
    test1.play("majesty")
    expect(test1.won?).must_equal(false)
  end

  it "Testing to make sure won works and returns true for over 100 points" do
    test1 = Scrabble::Player.new("Olivia")
    test1.play("potato")
    test1.play("majesty")
    test1.play("xylophone")
    expect(test1.won?).must_equal(true)
  end

  it "Testing to make sure won returns false for exactly 100 points" do
    test1 = Scrabble::Player.new("Olivia")
    test1.play("ZZZZZ")
    test1.play("ZZZZZ")
    expect(test1.won? ).must_equal(false)
  end

  it "Testing to return highest scoring word" do
    test1 = Scrabble::Player.new("Olivia")
    test1.play("potato")
    test1.play("majesty")
    test1.play("xylophone")
    expect(test1.highest_scoring_word).must_equal("MAJESTY")
  end

  it "Testing to return highest scoring word score" do
    test1 = Scrabble::Player.new("Olivia")
    test1.play("potato")
    test1.play("majesty")
    test1.play("xylophone")
    expect(test1.highest_word_score).must_equal(69)
  end


  ########## END OF WAVE 2 TESTS ##########

  it "Testing to make sure TileBag.new returns default tiles" do
    expect((Scrabble::TileBag.new).tile_bag).must_equal({"A"=>9, "B"=>2, "C"=>2, "D"=>4,
     "E"=>12, "F"=>2, "G"=>3, "H"=>2,
     "I"=>9, "J"=>1, "K"=>1, "L"=>4,
     "M"=>2, "N"=>6, "O"=>8, "P"=>2,
     "Q"=>1, "R"=>6, "S"=>4, "T"=>6,
     "U"=>4, "V"=>2, "W"=>2, "X"=>1,
     "Y"=>2, "Z"=>1})
  end

  it "It must raise an ArgumentError if draw_tiles is given a String parameter" do
    expect (proc { Scrabble::TileBag.draw_tiles("nope")} ).must_raise NoMethodError
  end

  it "Testing to see if draw_tiles always returns the same num of letters that were input" do
    test1 = Scrabble::TileBag.new
    expect(test1.draw_tiles(7).length).must_equal(7)
  end

  it "Testing to see if tiles remaining equals tiles actually remaining" do
    test1 = Scrabble::TileBag.new
    expect(test1.tiles_remaining).must_equal(98)
  end

  it "Testing to see if tiles remaining equals correct number of tiles remaining after tiles have been drawn" do
    test1 = Scrabble::TileBag.new
    test1.draw_tiles(7)
    expect(test1.tiles_remaining).must_equal(91)
  end


end
