# CSV to LDIF script
# Author: John Leslie
# Date: 28 DEC 2015
# Usage: # ruby script.rb <input_file.csv> <output_file.ldif>

# Method
def PDPCONTEXT(input,output)
  # Set up a "counter" and initialize to 0, note: counter must be an 'Instance Variable' or error 'dynamic constant assignment' is thrown
  # This is due to it the method dynamically assigning it everytime it is called, and must be "visible" outside the method.
  @PDP_entry_count = 0
  # pass ARGS to respective File operations
  infile = File.open(input, 'r')
  ldiffile = File.open(output, "w")
  # Begin Looping through CSV file, line by line
  while !infile.eof?
     line = infile.readline
     # put each line into an array where each element in the array is delimitated by a ','
     csvline = line.split(",")
     # Set up the LDIF entry for each line in the CSV by accessing the array. each element in the array is a value in the entry
     ldiffile.puts "dn: pdpContextName=#{$PDP_entry_count},o=pdpcontext,o=hlr,o=nss,o=services,o=default,DC=C-NTDB"
     ldiffile.puts "objectClass: PDPCONTEXT"  # objectClass name for the entry
     ldiffile.puts "vplmnAllowed: #{csvline[0]}"
     ldiffile.puts "pdpType: #{csvline[1]}"
     ldiffile.puts "accPointName: #{csvline[2]}"
     ldiffile.puts "chargCharac: #{csvline[3]}"
     ldiffile.puts "extPdpType: #{csvline[4]}"
     ldiffile.puts "\n"
     # Increment the counter
     @PDP_entry_count = @PDP_entry_count + 1
  end # END OF WHILE LOOP
  ldiffile.close # close output file
  infile.close # THEN close input file
end # END of Method

# Take in ARGS
input = ARGV[0] # input file
output = ARGV[1] # output file

# Basic Error Handling / 'help' statement
if ARGV.length == 0 || ARGV[0] == "-help"
	print "\nPlease use the following format:\n$ ruby csv_to_ldif.rb <input_file.csv> <output_file.ldif>\nRun: $ ruby csv_to_ldif.rb -help   to display this message.\n\n"
elsif ARGV[0].length != 0 && ARGV[1].length == 0
  print "\nYou forgot to enter an output file name\nPlease consult '-help' flag at runtime for argument list.\n\n"
else
	# Call Method / Convert CSV --> LDIF
	PDPCONTEXT(input,output)	
end

