# CSV to LDIF script
# Author: John Leslie
# Date: 28 DEC 2015
# 

# "Includes"


# File I/O
=begin
file = File.open("sample.txt", 'r')
while !file.eof?
   line = file.readline
   puts line
end

datafile = File.open("sample.txt", "r")
lines = datafile.readlines         
datafile.close

lines.each{ |line| puts line }   

File.open("sample.txt").readlines.each do |line|
   puts line
end

lines = File.open("sample.txt", "r"){ |datafile| 
   datafile.readlines
}

lines.each{|line| puts line}
=end
somefile = File.open("sample.txt", "w")
somefile.puts "Hello file!"
somefile.close
# Do/While


# Checks

