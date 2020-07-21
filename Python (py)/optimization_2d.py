# -*- coding: utf-8 -*-
"""
Created on Thu Aug 23 14:00:48 2018

@author: llazarus

Numerical search for optimum value (max or min) of a 2D function via gradient.
"""

#import numpy as np

x = 1.
y = 0.
n = 0

def f(x,y):
    f = -13050 + 4550*x - 700*(x**2) + 3400*y - 800*(y**2) + 350*x*y
    return f

def dfdx(x,y):
    fx = 4550 - 1400*x + 350*y
    return fx

def dfdy(x,y):
    fy = 3400 - 1600*y + 350*x
    return fy

scale = 0.0001
maxmintog = 1.

while (dfdx(x,y)**2 + dfdy(x,y)**2) > 0.01 and n < 1000:
    x = x + maxmintog*scale*dfdx(x,y)
    y = y + maxmintog*scale*dfdy(x,y)
    n = n + 1       # n is a failsafe so you don't get an infinite loop
    
if n==1000:
    print("Inconclusive. Check min/max.")

print(x)
print(y)
print(f(x,y))
