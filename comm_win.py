a = open('lines_only_in_f1.txt','w')
b = open('lines_only_in_f2.txt','w')
c = open('lines_present_both_12.txt','w')

try:
    with open('f1.txt', 'r') as r:
        sorted_f1 = sorted(r)
except FileNotFoundError:
    print(f"The file 'f1.txt' does not exist.")
except IOError:
    print("An error occurred while reading the file.")

try:
    with open('f2.txt', 'r') as r:
        sorted_f2 = sorted(r)
except FileNotFoundError:
    print(f"The file 'f2.txt' does not exist.")
except IOError:
    print("An error occurred while reading the file.")

len_f1 = len(sorted_f1)
len_f2 = len(sorted_f2)

i = 0
j = 0
while i < len_f1 and j < len_f2:
    if sorted_f1[i] < sorted_f2[j]:
        a.write(sorted_f1[i])
        i += 1
    elif sorted_f1[i] > sorted_f2[j]:
        b.write(sorted_f2[j])
        j += 1
    else: #sorted_f1[i] == sorted_f2[j]: 
        c.write(sorted_f1[i])
        i += 1
        j += 1

if i > len_f1:
    while j < len_f2:
        b.write(sorted_f2[j])
        j += 1
else: #j > len_f2
    while i < len_f1:
        a.write(sorted_f1[i])
        i += 1
        
a.close()
b.close()
c.close()
