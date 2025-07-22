file1="comm/file1.txt"
file2="comm/file2.txt"

sort $file1 -o $file1
sort $file2 -o $file2

comm -23 $file1 $file2