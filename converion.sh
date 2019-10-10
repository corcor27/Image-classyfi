from PIL import Image
img = Image.open("boob-test1.jpg")
area = (2388, 2540, 586, 985)
cropped_img = img.crop(area)
cropped_img.save("Run22_lal_chi_p.png")
