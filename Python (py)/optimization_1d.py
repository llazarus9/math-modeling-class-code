# -*- coding: utf-8 -*-
"""
Created on Thu Aug 23 13:27:23 2018

@author: llazarus

Numerical search for optimum value (max or min) of a 1D function via gradient.
"""

import numpy as np
import matplotlib.pyplot as plt

x = 4
n = 0

def f(x):
    f = 3*np.cos(x)-x
    return f

def fprime(x):
    fp = -3*np.sin(x)-1
    return fp

scale = 0.1
maxmintog = -1

while abs(fprime(x)) > 0.01 and n < 1000:
    x = x + maxmintog*scale*fprime(x)
    n = n + 1       # n is a failsafe so you don't get an infinite loop
    
if n==1000:
    print("Inconclusive. Check min/max.")

print(x)
print(f(x))

xv=np.linspace(-2*np.pi,2*np.pi,200)
plt.plot(xv,f(xv),'b')
plt.plot(x,f(x),color='r',marker='*')
plt.show()

