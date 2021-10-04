import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(0,1,100)
f = 10
y = np.sin(2*np.pi*f*t)+1
y = y*100
data = []
for i in range(len(y)):
    data.append(str(hex(int(y[i])))[2:]+"\n")
plt.plot(t,y)
plt.show()
print(data[:5])
file = open("Gen_data.txt","a")
file.writelines(data)
file.close()

