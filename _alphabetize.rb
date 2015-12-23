# Create a method named "alphabetize" with two arguments: the first will be for
# the array to be sorted. The second will be a flag for reverse order.
# To set the flag as a toggle we will use a Boolean, but we need to define the
# 'default value' for the Boolean incase the user does not specify it at runtime
def alphabetize(arr, rev=false)
    arr.sort!
    # Logic to check for reverse flag
    if rev == true
        arr.reverse!
    # Logic to supply Ascending order
    else
        return arr
    end
    
end

# Create an array we will sort
numbers = [1,5,75,123,1,3,90,0,-2,47]

# Call our method
alphabetize(numbers)

# Print out the sorted array
puts numbers