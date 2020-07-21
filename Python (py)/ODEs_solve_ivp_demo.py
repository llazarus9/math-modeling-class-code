# -*- coding: utf-8 -*-
"""
Created on Fri Aug 24 12:40:18 2018

@author: llazarus
"""

import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

def rhs(t,y): return y

sol = solve_ivp(rhs, [0, 1], [1], t_eval=np.linspace(0,1))

plt.plot(sol.t,sol.y[0],'bo-')
plt.show()

