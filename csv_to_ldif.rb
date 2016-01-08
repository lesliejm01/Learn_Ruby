# CSV to LDIF script
# Author: John Leslie
# Date: 28 DEC 2015
# Usage: $ ruby csv_to_ldif.rb <input_file.csv> <output_file.ldif>
#        $ ruby csv_to_ldif.rb -help

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
# If no ARGS or '-help' show HELP
if ARGV.length == 0 || ARGV[0] == "-help"
	print "\nWelcome To CSV To LDIF Converter!\n\tPlease use the following format:\n\t$ ruby csv_to_ldif.rb <input_file.csv> <output_file.ldif>\n\tRun: $ ruby csv_to_ldif.rb -help   to display this message.\n\n"
# If Input file doesn't exist AND Output filename NOT given (assume user doesn't know command-line ARGS)
elsif File.exists?(ARGV[0]) == false && ARGV[1] == nil
  print "\nWelcome To CSV To LDIF Converter!\n\tPlease use the following format:\n\t$ ruby csv_to_ldif.rb <input_file.csv> <output_file.ldif>\n\tRun: $ ruby csv_to_ldif.rb -help   to display this message.\n\n"
# If Input file exists, but Output filename NOT given
elsif File.exists?(ARGV[0]) == true && ARGV[1] == nil
  print "\nERROR! You forgot to enter an output file name\n\n"
# Input file doesn't exist and Output filename given
elsif File.exists?(ARGV[0]) == false && ARGV[1] != nil
  print "\nERROR! Input file doesn't exist! check filename\n\n"
# Otherwise: call the Method
else
	# Call Method / Convert CSV --> LDIF
	PDPCONTEXT(input,output)
  print "\nCOMPLETE!\n\n"	
end

