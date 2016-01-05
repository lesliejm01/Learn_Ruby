# CSV to LDIF script
# Author: John Leslie
# Date: 28 DEC 2015
# 

# "Includes"


# File I/O
file = File.open("sample.txt", 'r')
while !file.eof?
   line = file.readline
   puts line
end

File.open("sample.txt").readlines.each do |line|
   puts line
end

# Do/While


# Checks

