print "Pleathe Enter a Phrathe and Preth Enter!"
user_input = gets.chomp.downcase!
puts user_input
if user_input.include? "s"
    #puts "found some 'S's'"
    user_input.gsub!(/s/, "th")
    puts user_input
else
    print "No S's Detected!"
end

print "The Daffy Duckified Thtring is: #{user_input}"
