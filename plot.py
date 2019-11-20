import matplotlib as mpl
mpl.use('Agg') #set the backend to Agg to make a png file instead of displaying on screen
import matplotlib.pyplot as plt
plt.plot(range(10))
plt.savefig('temp.png')
