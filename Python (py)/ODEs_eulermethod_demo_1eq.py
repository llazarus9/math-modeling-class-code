# -*- coding: utf-8 -*-
"""
Created on Fri Aug 24 11:30:06 2018

@author: llazarus

Euler's method demo (1 ODE - exponential growth)
"""

import numpy as np
import matplotlib.pyplot as plt

t0 = 0
t1 = 1
n = 16
dt = (t1-t0)/n

k = 1
def rhs(t,x):
    dxdt = k*x
    return dxdt

t = np.zeros(n+1)
x = np.zeros(n+1)

t[0] = t0
x[0] = 1

for i in range(n):
    t[i+1] = t[i] + dt
    x[i+1] = x[i] + dt*rhs(t[i],x[i])
    
def sol(t):
    x = np.exp(k*t)
    return x

plt.plot(t,x,'ro-')

tv = np.linspace(t0,t1,200)
plt.plot(tv,sol(tv),'b')
plt.show()

