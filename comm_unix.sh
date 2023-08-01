comm -23 <(sort f1.txt) <(sort f2.txt) > lines_only_in_f1.txt
comm -13 <(sort f1.txt) <(sort f2.txt) > lines_only_in_f2.txt
comm -12 <(sort f1.txt) <(sort f2.txt) > lines_present_both_12.txt

: << 'COMMENT'  
comm:

NAME
       comm - compare two sorted files line by line

SYNOPSIS
       comm [OPTION]... FILE1 FILE2

...

       -1     suppress lines unique to FILE1

       -2     suppress lines unique to FILE2

       -3     suppress lines that appear in both files
So
comm -2 -3 file1 file2 > file3 gets the lines present only in f1

The input files must be sorted. If they are not, sort them first. This can be done with a temporary file, or... < (sort file 1) provided that your shell supports process substitution (bash does).

ALTERNATIVE WAY WITH GREP

grep -Fxvf <(sort f2.txt) <(sort f1.txt) > lines_only_in_f1
grep -Fxvf <(sort f1.txt) <(sort f2.txt) > lines_only_in_f2
grep -Fxf <(sort f1.txt) <(sort f2.txt) > lines_present_both_12

grep:

The -F tells grep to interpret PATTERNS as fixed strings, not regular expressions.
The -x tells grep to select only those matches that exactly match the whole line not partiall match.
With the -f, grep obtains the patterns from FILE, one per line.
The -v just inverts the sense of matching, to select non-matching lines.

COMMENT