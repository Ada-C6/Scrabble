require_relative "../module"
require_relative "../lib/Scoring"
require_relative "../lib/TileBag"
# :: module reference

class Scrabble::Player < Scrabble::TileBag

  attr_reader :name, :picked_tiles

  def initialize(name)
    @name = name
    @word_score = 0
    @total_score = 0
    @words_by_player = []

  end

  def plays
    # returns Array of words played
    return @words_by_player
  end

  def play(word)
    # play(word): Function: adds the input word to words_by_player
    # returns false if player has already won, otherwise return @word_score

    if @total_score > 100
      return false
    end
    #picked_tiles = []
    #player1.play("C", "A", "T")
      #if .any letters dont ! == playershand.
        #throw an error
      #else
        #continue playing
      #end
    letters_played = word.char
    if letters_played.all? { |letter| letter.include? picked_tiles }
      @words_by_player << word
      @word_score = Scrabble::Scoring.score(word)
      return @word_score
    else
      return "You can't don't have correct letters to play that word, friend!"
    end
  end

  def total_score
    # Returns the sum of scores of played words: @total_score
    @words_by_player.each do |word|
      @total_score += Scrabble::Scoring.score(word)
    end

    return @total_score
  end

  def won?
    # If the player has over 100 points, returns true, otherwise returns false
    if @total_score >= 100
      return true
    else
      return false
    end
  end

  def highest_scoring_word
    # Returns the highest scoring played word
    return Scrabble::Scoring.highest_score_from(@words_by_player)
  end

  def highest_word_score
    # Returns the highest_scoring_word's score
    # proudest moment for Rachel lol
    high_score_word = highest_scoring_word
    highest_score = Scrabble::Scoring.score(high_score_word)
    return highest_score
  end

# additonal wave 3 requirement:
  def tiles
# a collection of letters that they player can play.(max: 7).
#when plays a word, make sure user has letters so that they can play their word, and then remove tiles from the bag
#[come back to this. ]
    tilebag1 = Scrabble::TileBag.new
    # taking this logic out:
    # picked_tiles << @flattened_default_tile_bag.pop(7)
    tilebag1.draw_tiles(7)
  end

  def draw_tiles(num_of_tiles)
# fills the tile array until it has 7 letters from the given tile bag.

    if @picked_tiles + num_of_tiles >= 7
      return "hit error!"
    else
      # inherit from Tilebag class. & figure out proper syntax.
      super + tilebag1
    end
  end
end





player1 = Scrabble::Player.new("Joe")
puts  player1.tiles.play("cat")



# puts player1.play("cats")
#=> ["cats"] 6

# same length, same score.
# player1 = Scrabble::Scoring.total_score([["sizzles", "fuzz", "dog", "cat"])
# #
# #
# puts player1.total_score
