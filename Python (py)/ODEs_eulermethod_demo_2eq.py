# -*- coding: utf-8 -*-
"""
Created on Fri Aug 24 11:30:06 2018

@author: llazarus

Euler's method demo (2 ODEs - sin/cos to show error in the method)
"""

import numpy as np
import matplotlib.pyplot as plt

t0 = 0
t1 = 4*np.pi
n = 128
dt = (t1-t0)/n

k = 1
def rhs(t,x):
    dxdt = np.zeros(2)
    dxdt[0] = x[1]
    dxdt[1] = -x[0]
    return dxdt

t = np.zeros(n+1)
x = np.zeros((n+1,2))

t[0] = t0
x[0,0] = 1
x[0,1] = 0

for i in range(n):
    dxdt = rhs(t[i],x[i,])
    t[i+1] = t[i] + dt
    x[i+1,] = x[i,] + dt*dxdt
    
def sol(t):
    x = np.zeros((len(t),2))        #leave this open to a vector input of t
    x[:,0] = np.cos(t)
    x[:,1] = np.sin(t)
    return x

plt.plot(t,x[:,0],'ro-')

tv = np.linspace(t0,t1,200)
plt.plot(tv,sol(tv)[:,0],'b')
plt.show()

