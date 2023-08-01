# comm-linux-win
comm is the command used to compare two sorted files line-by-line

Here we have a Bash script for using comm to compare two files, say f1.txt and f2.txt, and write 3 output files:
- lines present only in f1
- lines present only in f2
- lines present both in f1 and f2

We also made a Python script for it to work in windows env.

Obs: A best practice is to leave a blank line at the end of each of the two files, otherwise the same string could occur in two different lines, where one ends with \n and the other not, causing failure in comparison and making so the output may have two lines merged, because one of them didn't finish with \n new line.
