test cases ->
# tied with 2
# two thirty point words (frizzy and mezuzah both = 30) and two others
["frizzy", "mezuzah", "cat", "milk"]
# tied with 3
# three twenty point words (boxwood, chintz, bozeman) and three others
["boxwood", "chintz", "bozeman" "dog", "litter", "bike"]
# tie with fewest letters
["abyss", "abrupt", "dog", "cat"]
# tie with one 7-letter word and one with fewer letters
["acardia", "abyss", "dog", "cat"]
# tie with two words of same length and value
["nuzzle", "nozzle", "dog", "cat"]






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



def self.highest_score_from(array_of_words)
  # output is word in array with highest_score_from
  scored_words_array = []
  array_of_words.each do |word|
     scored_words_array << score(word).to_i
  end
  return scored_words_array.max
end

________________

store highest score in variable max_score

if new score is higher than max_score, then replace it

if max_score equals next word  ->
    (tie breaker method with ifs)

word.index[word]
