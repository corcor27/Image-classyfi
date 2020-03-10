import numpy as np
import cv2
import pydicom as dicom
from scipy import ndimage as ndi
from skimage import exposure
import matplotlib.pyplot as plt
import os
import csv
from skimage.segmentation import watershed
from skimage.feature import peak_local_max

LB = 0
path = r"C:\Users\cory1\Documents\test-folder\data_set\dicom_M\1556-1.dcm"
#path = r"C:\Users\cory1\Documents\test-folder\data_set\dicom_M\1509-2.dcm"
#ren = os.listdir(path)
#length = len(ren)
#for m in range(0,length):
    #addition = os.path.join(path,ren[m])

def image_position(image,x1,x2,z1,z2, LB):
    Beginning_image = dicom.dcmread(path)
    beginning_image = Beginning_image.pixel_array
    
    x1ml = x1 
    x2ml = x2 
    z1ml = z1
    z2ml = z2
    diffxml = x2ml - x1ml
    diffzml = z2ml - z1ml
    print(diffxml,diffzml)
    array = np.zeros((diffzml, diffxml))
    for j in range(z1ml, z2ml):
        for k in range(x1ml, x2ml):
            array[j-z1ml,k-x1ml] = beginning_image[j,k]
    density = np.zeros((diffzml,diffxml))
    u = 5
    UB = np.amax(array)
    LB = LB
    for i in range(u, diffzml-u):
        for j in range(u, diffxml-u):
            lum = np.sum(array[i-u:i+u,j-u:j+u])/(len(array[i-u:i+u,j-u:j+u])**2)
            if LB <= lum <= UB:
                density[i,j] = lum
            else:
                density[i,j] = 0
                
    pyrlvlx = np.zeros((diffzml,diffxml))
    pyrlvly = np.zeros((diffzml,diffxml))
    Grmaglvl = np.zeros((diffzml,diffxml))
    pyrlvlx[:,:] = ndi.sobel(density, 0)
    pyrlvly[:,:] = ndi.sobel(density, 1)
    Grmaglvl = (((pyrlvlx)**2)+((pyrlvly)**2))**0.5
    
    return diffzml, diffxml, Grmaglvl      

  
def fallers(array, diffzml, diffxml, x0, z0, number,LB):
    space = np.zeros((diffzml, diffxml))
    pos_x = []
    pos_z = []
    pos_x.append(x0)
    pos_z.append(z0)
    space[x0,z0] = 1
    for rr in range(0,number):
        x = pos_x[rr]
        z = pos_z[rr]
        di = np.random.randint(-1,high = 2)
        dk = np.random.randint(-1,high = 2)
        new_x = int(x + di)
        new_z = int(z + dk)
        old_pos = round(array[x,z])
        new_pos = round(array[new_x,new_z])
        E = round((old_pos/100)*5)
        
        if new_pos >= old_pos - E and new_pos >= LB:
            space[new_x,new_z] = 1
            pos_x.append(new_x)
            pos_z.append(new_z)
        else:
            break
    return space

            
def find_max(array, diffzml, diffxml, tt) :
    for ii in range(0,diffzml):
        for kk in range(0,diffxml):
            if array[ii,kk] == tt:
                x0 = int(ii)
                z0 = int(kk)
    return x0,z0
    
def map_space(array, diffzml, diffxml, number, LB):
    tt = np.amax(array)
    space = np.zeros((diffzml, diffxml))
    x0 = find_max(array, diffzml, diffxml, tt)[0]
    z0 = find_max(array, diffzml, diffxml, tt)[1]
    for ll in range(0,10000):        
        fall = fallers(array, diffzml, diffxml, x0, z0, number, LB)
        space = np.add(space, fall)
                
    new_space = np.zeros((diffzml, diffxml))
    for ii in range(0,diffzml):
        for kk in range(0,diffxml):
            if space[ii,kk] >= 1:
                new_space[ii,kk] = array[ii,kk]
            
    
    return new_space

    
    

dcm_sample = image_position(path, 1642,2272, 1119, 1498, LB)
#dcm_sample = image_position(path, 1033,1217,1782,1966, LB)
#dcm_sample = image_position(path, 1102,1281,2864,3040)

#LMLO = map_space(dcm_sample[2], dcm_sample[0], dcm_sample[1], 10000, LB)

#plt.imshow(LMLO, cmap='gray')
#plt.imshow(dcm_sample[2])
plt.imshow(dcm_sample[2])



        

   
    
    
    
