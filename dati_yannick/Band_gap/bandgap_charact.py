# Author: Yannick Konstandin
# University of Bergamo
# June/2022
# bandgap voltage
# set power-supply
# set registers
# read output from multimeter
# plot data

import logging
import time
from random import random
from math import floor
from tabulate import tabulate
from pyarcadia.test import Test
from pyarcadia.sequence import SubSequence
from pyarcadia.data import Pixel
import sys
import visa
import pyvisa
import csv
import time
import numpy as np
from ctypes import util
from agilent_34461A import Agilent34461A
from agilent_34461A import Power_supply
import matplotlib.pyplot as plt
import pandas as pd
import decimal
from tkinter import * 
import tkinter.messagebox 


#####################################
#must be changed manually
TP = 16     # set testpoint
tmp = 70   # set temperature
#####################################

plt.close("all")
rm = pyvisa.ResourceManager('@py')
ps_agilent = rm.open_resource('USB0::2391::36632::MY52350174::0::INSTR')
agilent = Agilent34461A(rm)
x = Test()

#set output of PS
ps_agilent.write('VOLT 1.2')
ps_agilent.write('SENS:CURR:PROT 2') #compliance in A
#print('Voltage:', volt, 'V')

# define voltage range and steps
word_bits = np.arange(0,16,1)
mean = np.arange(0,16,1)
#slope = np.arange(15,-1,-1)
slope = np.arange(0,16,1)
ps_volts = np.array([1.08, 1.2, 1.32])
i = np.arange(0, 3, 1)

results = pd.DataFrame()

# Pop-up
top = Tk()
top.geometry(f"200x10+{800}+{400}") # size and position of window
tkinter.messagebox.showinfo('Bandgap characterization','Starting measurement of TP'+str(TP)+' at '+str(tmp)+'°C.')
top.destroy()
#top.mainloop()

register = TP -1
register_mean = 'BIAS'+str(register)+'_BGR_MEAN' 
register_slope = 'BIAS'+str(register)+'_BGR_SLOPE'

if tmp < 0:
    temper = tmp*-1
    filename = '/home/microlab/Documenti/Python_scripts/Band_gap/final_characterization/Results_TP'+str(TP)+'_REG_m'+str(temper)+'.csv'
else:
    filename = '/home/microlab/Documenti/Python_scripts/Band_gap/final_characterization/Results_TP'+str(TP)+'_REG_'+str(tmp)+'.csv'

for n in i:
    PS_VOLT = ps_volts[n]
    ps_agilent.write('VOLT %1.2f' % PS_VOLT)
    for slopes in slope:
        # set slope value
        x.chip.write_gcrpar(register_slope, slopes)
        slope0 = x.chip.read_gcrpar(register_slope)
        print('slope: '+str(slope0)+'')

        for word in mean:
            # set mean value
            x.chip.write_gcrpar(register_mean, word)
            mean0 = x.chip.read_gcrpar(register_mean)
            print('slope:', slope0,'mean:', mean0)
            time.sleep(0.01)
            #readback voltage of PS
            vin_real = float(ps_agilent.query('MEAS:VOLT:DC?'))
            Iin_real = float(ps_agilent.query('MEAS:CURR:DC?'))
            print('PS Iout measure: %1.4f' %Iin_real)
            print('PS Vout set to: %1.4f' %PS_VOLT)
            print('Vin real: %1.4f' % vin_real)
            #read voltage of TP
            volt = agilent.get_voltage_rang_1()
            temp = {}
            temp['TP'] = TP
            temp['reg'] = register
            temp['temp'] = tmp
            temp['Vin_real'] = vin_real
            temp['Vin'] = PS_VOLT
            temp['SLOPE'] = slope0
            temp['MEAN'] = mean0
            temp['Volt'] = volt
            results = results.append(temp, ignore_index=True)

results.to_csv(filename)
plt.plot(results['SLOPE'],results['Volt'], 'b.')
plt.xlabel('Slope')
plt.ylabel('bandgap [V]')
plt.title('Bandgap measurement of TP'+str(TP)+' at '+str(tmp)+'°C')
plt.grid(visible=True, which='major', color='grey', linestyle='--')
#plt.legend([''])
ps_agilent.write('SYST:BEEP 1000,0.7')
plt.show() 