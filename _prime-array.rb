=begin
In Ruby 1.9, we use Prime.instance instead, and the array magic is already built-in 
we don't have to create prime_array or loop through it ourselves.
=end

require 'prime'

def first_n_primes(n)
  # Check for correct input!
  "n must be an integer" unless n.is_a? Integer
  "n must be greater than 0" if n <= 0

  # The Ruby 1.9 Prime class makes the array automatically!
  prime = Prime.instance
  prime.first n
end

