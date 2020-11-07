from afinn import Afinn
import csv

fd = open("post_no.txt","r")
postno = fd.readlines()
print(postno[0])
to_read = postno[0]+"_filteredComments.txt"
file1 = open(to_read, 'r')
Lines = file1.readlines()
file1.close()
analyze = Afinn()
row =[]
for line in Lines:
    print("\nline: ",line)
    output = line.split(';')
    #print(output[1])
    score = analyze.score(output[1])
    print("Comment:"+output[1].strip()+"\nScore:"+str(score))
    l1= [output[0],output[1],output[2].strip(),int(score)]
    row.append(l1)
filename = "output.csv"
fields= ['no-of-likes','comments','serial','score']
# writing to csv file
with open(filename, 'w') as csvfile:
    # creating a csv writer object
    csvwriter = csv.writer(csvfile)

    # writing the fields
    csvwriter.writerow(fields)

    # writing the data rows
    csvwriter.writerows(row)
