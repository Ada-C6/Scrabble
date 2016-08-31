require_relative 'spec_helper'
require_relative '../scrabble' # this is the module file
require_relative '../lib/scrabble_scoring'

describe 'testing scrabble module' do

  it 'Must return correct key value' do
    # skip
    expect(Scrabble::SCORE_HASH[:A]).must_equal(1)
    expect(Scrabble::SCORE_HASH[:D]).must_equal(2)
    expect(Scrabble::SCORE_HASH[:B]).must_equal(3)
    expect(Scrabble::SCORE_HASH[:F]).must_equal(4)
    expect(Scrabble::SCORE_HASH[:K]).must_equal(5)
    expect(Scrabble::SCORE_HASH[:X]).must_equal(8)
    expect(Scrabble::SCORE_HASH[:Q]).must_equal(10)
  end

  it 'score method\'s argument should only include letters' do
    # skip
    expect( proc {Scrabble::Scoring.score("everything!!!")} ).must_raise(ArgumentError)
    expect( proc {Scrabble::Scoring.score("everything123")} ).must_raise(ArgumentError)
  end

  it 'score method should raise ArgError if the arg is not a string' do
    # skip
    expect( proc {Scrabble::Scoring.score(12345)} ).must_raise(ArgumentError)
    expect( proc {Scrabble::Scoring.score(:symbol)} ).must_raise(ArgumentError)
    expect( proc {Scrabble::Scoring.score(4000000.49)} ).must_raise(ArgumentError)
  end

  it 'score method should return a fixnum' do
    # skip
    expect(Scrabble::Scoring.score("something").must_be_instance_of(Fixnum))
  end

  it 'score method must return correct score for a word' do
    # skip
    expect(Scrabble::Scoring.score("hello")).must_equal(8)
  end

  it 'score method must add 50 points to score for a 7-letter word' do
    # skip
    expect(Scrabble::Scoring.score("jazzmen").must_equal(84))
  end

  it 'highest_score_from method raise ArgError if the arg is not an array' do
    # skip
    expect( proc {Scrabble::Scoring.highest_score_from("string")} ).must_raise(ArgumentError)
    expect( proc {Scrabble::Scoring.highest_score_from(:symbol)} ).must_raise(ArgumentError)
    expect( proc {Scrabble::Scoring.highest_score_from(4000000.49)} ).must_raise(ArgumentError)
  end

  it 'highest_score_from ust return word with with highest score' do
    # skip
    expect(Scrabble::Scoring.highest_score_from(["zzzz", "abc", "xat"]).must_equal("zzzz"))
  end

  it 'in the case of a tie, highest_score_from method must return fewer-lettered word over higher lettered-word unless higher.length == 7' do
    # skip
    expect(Scrabble::Scoring.highest_score_from(["aaaa","y"]).must_equal("y"))
  end

  it 'in the case of a tie, if one of the tied words is 7 letters, highest_score_method must return the 7 letter word' do
    # skip
    expect(Scrabble::Scoring.highest_score_from(["zzzzzz","iiiiiif"]).must_equal("iiiiiif"))
  end

  it 'in the case of a tie, if the two words are the same score & same length, pick the first one to win' do

    expect(Scrabble::Scoring.highest_score_from(["aaaaaa","iiiiii"]).must_equal("aaaaaa"))
  end

  it 'determine_tie must return true if there is a tie and false if there is no tie' do
    expect(Scrabble::Scoring.determine_tie({"zzz"=>30,"qqq"=>30}).must_equal(true))
    expect(Scrabble::Scoring.determine_tie("xxkehgbnb"=>85,"a"=>1).must_equal(false))
  end

  it 'tie method must return winning word' do
    expect(Scrabble::Scoring.tie({"zzz"=>30,"qqq"=>30, "abc"=>5}).must_equal("zzz"))
  end


end
