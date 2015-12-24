# Create a hash to hold our movies and their ratings
# Add user prompts to take in user input as well
movies = {
  Terminator: 4   
}
run = true
while run == true
puts "What do you want to do?"
choice = gets.chomp.downcase

# Create a "Case Statement" to modularize the menu commands
case choice
# ============================ ADD ===========================================
when "add"
    # Add a prompt for the user to enter the title and take user input
    puts "Please enter the name of the Movie you wish to Add."
    # Take input and convert to a Symbol (Much better performance / convention)
    title = gets.chomp.to_sym
    # Add a prompt for the user to enter the rating and take user input
    puts "Please enter the Rating for the Movie you just entered."
    # Take input and convert to an Integer (necessary for Select / Sorting)
    rating = gets.chomp.to_i
    # Test if the user input exists in the Hash already
    # If Not:
    if movies[title] == nil
        # Add the Key => Value pair to the Hash "movies"
        movies[title] = rating
        # Affirm the users inputs, and inform them they have been added
        puts "The Movie: '#{title}' with Rating: #{rating}, was added!"
    # If it Exists:
    else
        # Provide output explaining the Movie is already in the Movie Hash
        puts "The desired Movie already exists in the Database, use 'Update' 
              instead of 'Add'"
    end
# ============================ UPDATE ========================================
when "update"
    puts "Please enter the name of the Movie you wish to Update."
    title = gets.chomp.to_sym
    if movies[title] == nil
        puts "The desired Movie is not in the Database, use 'Add' instead of 
             'Update'"
    else
        puts "Please enter an updated Rating for #{title}."
        rating = gets.chomp.to_i
        movies[title] = rating
        puts "The Movie: '#{title}' was updated with Rating: #{rating}!"
    end
# ============================ DISPLAY =======================================
when "display"
    puts "========== MOVIE DATABASE =========="
    movies.each do | movie , rating |
        puts "Movie: '#{movie}' Rating: #{rating}"
    end
    puts "=============== END ================"
# ============================ DELETE ========================================
when "delete"
    puts "Please enter the name of the Movie you wish to Delete."
    title = gets.chomp.to_sym
    if movies[title] == nil
        puts "Error! #{title} not found in Movie Database!"    
    else
        puts "Are you sure you wish to permanently delete #{title}?  y/n"
        confirm = gets.chomp.downcase
        #case confirm
        #when "y"
        if confirm == "y"
            movies.delete(title.to_sym)
            puts "Movie: #{title} permanently Deleted from Database!"
        #when "n"
        elsif confirm == "n"
            puts "Deletion Canceled!, nothing Deleted from Database!"
        else
            puts "Invalid choice, nothing Deleted from Database!"
        end
    end
# ============================= QUIT =========================================
when "quit"
    puts "Thank You for using Movie Database!"    
    run = false
# ============================ ERROR =========================================
else
    puts "Error! #{choice} is an invalid menu command!"

end # Kills Case Block
end # Kills While Loop
