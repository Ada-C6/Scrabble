CURRENT IDEA:
1. create a variable for max_score and max_scoring_word
max_score = 0
max_scoring_word = ""
2. iterate through array_of_words ( array_of_words.each do |word|
) and within that put if/elsif statements
3. For the if/elsif statements within loop ("if score(word).to_i > max_score", and then also "if score(word).to_i == max_score")
4. ONLY if they are equal, do if statements below

____________
FOR TIE-BREAKER IF STATEMENTS
1. word.chars.count >= 7 and then also word.chars.count < max_scoring_word.chars.count (so this deals with a couple of the tests we wrote earlier - basically just wrote this based on what we generated earlier)
then put this for both: max_score = score(word)
max_scoring_word = word

This SHOULD account for the tie-breaker situations we wrote tests for earlier.  I forgot about the .chars method that you can call on a string - it just looks at the characters and then the .count method counts them up!







____________
OLD IDEAS:
1. when looping through array of words, assign key as word (as string) and value as total amount
2. sort hash.values.sort.reverse -> will give us array of sorted values (highest to lowest)

3. are there any repeating values :.map same as .collect : goes through array or hash and does whatever you ask it to do -> then sticks answer into an array
4. only keep highest repeating values (delete others)
5. if there are highest repeating values THEN continue:
    6. create array of key lengths of remaining repeating values
hash = { "Cat" => 7, "Doggy" => 15, "Joe" => 5 }
array = []

hash.each do |k, v|

    array << k.length
end

puts array

_________
OLD CODE:
def self.highest_score_from(array_of_words)
  # output is word in array with highest_score_from
  scored_words_array = []
  array_of_words.each do |word|
     scored_words_array << score(word).to_i
  end
  return scored_words_array.max
end

________________


Ideas:
if max_scores_array has length of 1 - then DONE and return word that wins
else
iterate through this
tie breaker method with ifs  (compare with arrays, and then to return word refer to corresponding index)
end

if statements:
.min_by - Enumerables: array.min_by { |word| word.length } - will help with tied with 3 or 2 words when we return the one with fewer letters

if tie with two words of same length and value -> return max_scoring_words.first

word.index[word]
_______________________

test cases ->
# tied with 2
# two thirty point words (frizzy and mezuzah both = 30) and two others
["frizzy", "mezuzah", "cat", "milk"]

[30, 30, 5, 6]
# tied with 3
# three twenty point words (boxwood, chintz, bozeman) and three others
["boxwood", "chintz", "bozeman" "dog", "litter", "bike"]

# tie with one 7-letter word and one with fewer letters
["acardia", "abyss", "dog", "cat"]
# tie with two words of same length and value
["nuzzle", "nozzle", "dog", "cat"]
