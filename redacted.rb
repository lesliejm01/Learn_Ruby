puts "Enter a string you wish to redact"
text = gets.chomp
puts "Enter the word you wish to redact from the string"
redact = gets.chomp

words = text.split(" ")
#print "#{words}\n"
words.each do |word|
    if word == redact
        print "REDACTED "        
    else
        print word + " "
    end
end
