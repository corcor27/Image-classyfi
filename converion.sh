from PIL import Image

 

# Create an Image object from an Image

imageObject  = Image.open("./image_10-10-2019_0.jpg")

 

# Crop the iceberg portion

cropped     = imageObject.crop((2388,2540,586,895))

 

# Display the cropped portion

cropped.show()
