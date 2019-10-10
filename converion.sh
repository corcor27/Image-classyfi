from PIL import Image
img = Image.open("boob-test1.jpg")
area = (20, 20, 20, 20)
cropped_img = img.crop(area)
cropped_img.save("Run22_lal_chi_p.png")
