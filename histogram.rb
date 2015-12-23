# Prompt the use for input
# Store the input in a variable called "text"
puts "Please type a string of text, followed by the <enter> key"
text = gets.chomp

# Split up the input string into words with ".split" and put 
# them in an array called "words"
words = text.split(" ")

# Create a Hash called "frequencies" with 'default values' ie) { }
# Best to use new_hash = Hash.new(0) where '0' IS the 'default value'
# Note: if you attempt to access a non-existent KEY, the hash will return
# the 'default value'. In this case VALUE = time word is use in input
frequencies = Hash.new(0)

# Now we must populate 'frequencies' by iterating over 'words'
# For each elements in 'words' we will increment the value in 'frequencies'
# by '1'. This is why out 'default value' was '0'
words.each do | x |
    frequencies["#{x}"] += 1
end

# Sorting the Hash so it can be presented to the user
# We can sort by number of occurences (count) by using the VALUE in the Hash
# NOTE: the ' .sort_by ' Method returns an array of arrays and by default 
# sorts lowest --> highest
frequencies = frequencies.sort_by do | word , count |
    count
end
frequencies.reverse!

# User output time! Iterate over the 'frequencies' array and print all the
# KEY => VALUE pairs. In this example I will convert the count to a string as
# well, this is required in order to concatenate the integer onto the output
frequencies.each do | word , count |
    puts word + " " + count.to_s
end
