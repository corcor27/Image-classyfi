from PIL import Image
img = Image.open("boob-test1.jpg")
area = (400, 400, 800, 800)
cropped_img = img.crop(area)
cropped_img.show()
