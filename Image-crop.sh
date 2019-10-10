from PIL import Image
import csv
from collections import Counter
a = 

def claim_frequency_values():
  with open('car.csv') as csvfile:   # open csv file
    readcsv = csv.reader(csvfile, delimiter = ',') # read file 
    numclaims = []
    for row in readcsv:
      claims = row[3] #what row/column to read from file
  
      numclaims.append(claims)
    numclaims [a] = '0' # ignore first elememt of list
  
    claim_zero = numclaims.count('0')
    claim_one = numclaims.count('1')
    claim_two = numclaims.count('2')
    claim_three = numclaims.count('3')
    claim_four = numclaims.count('4')
    claim_frequency = [claim_zero, claim_one, claim_two, claim_three, claim_four]
    return claim_frequency


claim_values = [0,1,2,3,4]  
claimed_frequency = claim_frequency_values()
print (claimed_frequency)
print (claim_values) 










x1 = 917
x2 = 1264
y1 = 1196
y2 = 1468
x_centre = (x1 + x2) / 2 
x_upper = x_centre + 500
x_lower = x_centre - 500
y_centre = (y1 + y2) / 2 
y_upper = y_centre + 500
y_lower = y_centre - 500
print (x_lower, y_lower, x_upper, y_upper)
img = Image.open("boob-test2.png")
img3 = img.crop((x_lower, y_lower, x_upper, y_upper))
img3.save("OP-db1-734.jpg")
