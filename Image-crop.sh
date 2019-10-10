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
from PIL import Image
img = Image.open("boob-test2.png")
img3 = img.crop((x_lower, y_lower, x_upper, y_upper))
img3.save("OP-db1-734.jpg")
