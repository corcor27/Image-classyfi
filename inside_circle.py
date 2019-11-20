def inside_circle(total_count):
  
   count_per_chunk = int(total_count/4)
   x = np.float32(np.random.uniform(size=count_per_chunk))
   y = np.float32(np.random.uniform(size=count_per_chunk))

   for i in range(4-1):
      x = np.append(x,np.float32(np.random.uniform(size=count_per_chunk)))
      y = np.append(y,np.float32(np.random.uniform(size=count_per_chunk)))

   radii = np.sqrt(x*x + y*y)

   filtered = np.where(radii<=1.0)
   count = len(radii[filtered])
  
   return count
