# -*- coding: utf-8 -*-
"""
Created on Thu Aug 23 14:19:57 2018

@author: llazarus

Simulating a Galton machine (Plinko)
"""

import numpy as np
import matplotlib.pyplot as plt

import random

num_balls = 10000
num_steps = 14

def direction():
    p = random.random()
    if p < 0.5:
        return 0
    else:
        return 1

balls = np.zeros(num_balls)

for ball in range(num_balls):
    for step in range(num_steps):
        balls[ball] = balls[ball] + direction()
    
#print(balls)

plt.hist(balls,num_steps+1)
plt.show()

