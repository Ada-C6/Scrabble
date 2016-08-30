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
