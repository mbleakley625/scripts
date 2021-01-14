#!/bin/bash
#Script that searches a filesystem for the same file

echo "enter a directory: " 
read dir

for i in $(find $dir -type f);
do
	md5sum $i  
	#for every file in directory write the md5 hash sum to a file
done > hash.txt

#sort and only print out non-unique occurrences
dup=$(cat hash.txt | cut -d' ' -f1 | sort | uniq -d)

echo "Same md5 output: "
for i in $dup;
do
	#search in the txt file to match hashes with directory location
	grep $i hash.txt
done
#deletes file when completed
rm hash.txt
