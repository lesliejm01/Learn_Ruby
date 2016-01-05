# CSV to LDIF script
# Author: John Leslie
# Date: 28 DEC 2015
# Usage: # ruby script.rb <inputfile> <outputfile>

# Method
def PDPCONTEXT(input,output)
  # pass ARGS to respective File operations
  infile = File.open(input, 'r')
  ldiffile = File.open(output, "w")
  # Begin Looping through CSV file, line by line
  while !infile.eof?
     line = infile.readline
     # put each line into an array where each element in the array is delimitated by a ','
     csvline = line.split(",")
     #print "#{csvline}\n"
     # Set up the LDIF entry for each line in the CSV by accessing the array. each element in the array is a value in the entry
     ldiffile.puts "dn: pdpContextName=PDP_<entry count>,o=pdpcontext,o=hlr,o=nss,o=services,o=default,DC=C-NTDB"
     ldiffile.puts "vplmnAllowed: #{csvline[0]}"
     ldiffile.puts "pdpType: #{csvline[1]}"
     ldiffile.puts "accPointName: #{csvline[2]}"
     ldiffile.puts "chargCharac: #{csvline[3]}"
     ldiffile.puts "extPdpType: #{csvline[4]}"
     ldiffile.puts "\n"
  end # END OF WHILE LOOP
  ldiffile.close # close output file
  infile.close # THEN close input file
end # END of Method

# Take in ARGS
input = ARGV[0] # input file
output = ARGV[1] # output file

# Call Method
PDPCONTEXT(input,output)
