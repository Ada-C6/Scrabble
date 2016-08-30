require_relative 'Spec_helper'


require_relative '../lib/Scoring'

describe Scoring do

# may also be self.score(word) for method instead of .score(word)
# The letters A, E, I, O, U, L, N, R, S, T equal 1 point.
  it 'A converts to 1' do
    expect( Scoring.new(:A).score(word) ).must_equal(1)
  end

end
