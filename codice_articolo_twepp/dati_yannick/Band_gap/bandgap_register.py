
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

plt.close("all")
rm = pyvisa.ResourceManager('@py')
ps_agilent = rm.open_resource('USB0::2391::36632::MY52350174::0::INSTR')
agilent = Agilent34461A(rm)
x = Test()
#set output
ps_agilent.write('VOLT 1.2')
ps_agilent.write('SENS:CURR:PROT 0.2') #compliance in A
#print('Voltage:', volt, 'V')

header = ['set voltage', 'bandgap voltage','Temperature']

# define voltage range and steps
word_bits = np.arange(0,16,1)
results = pd.DataFrame()

ps_volts = np.array([1.08, 1.2, 1.32])
i = np.arange(0, 3, 1)
print(ps_volts)

#####################################
#must be manually changed
register_mean = 'BIAS0_BGR_MEAN'
register_slope = 'BIAS0_BGR_SLOPE'
TP = 1
tmp = 30
filename = 'Results_TP_1_REG_30.csv'
#####################################
for n in i:
    PS_VOLT = ps_volts[n]
    ps_agilent.write('VOLT %1.2f' % PS_VOLT)    
    for word in word_bits:
        # Set registers
        x.chip.write_gcrpar(register_mean, word)
        x.chip.write_gcrpar(register_slope, word)

        mean0 = x.chip.read_gcrpar(register_mean)
        slope0 = x.chip.read_gcrpar(register_slope)
        print('mean:', mean0, 'slope:', slope0)
        time.sleep(0.01)
        #readback voltage of PS
        vin_real = float(ps_agilent.query('MEAS:VOLT:DC?'))
        print('Vin real: %1.3f' % vin_real)
        #read voltage of TP
        volt = agilent.get_voltage_rang_1()
        temp = {}
        temp['TP'] = 1
        if PS_VOLT == 1.08:
            temp['TP'] = TP
            temp['temp'] = tmp
            temp['Vin_real'] = vin_real
            temp['Vin'] = PS_VOLT
            temp['SLOPE'] = word
            temp['MEAN'] = word
            temp['Volt'] = volt
            results = results.append(temp, ignore_index=True)
        elif PS_VOLT == 1.2:
            temp['temp'] = tmp
            temp['Vin_real_2'] = vin_real
            temp['Vin_2'] = PS_VOLT
            temp['SLOPE_2'] = word
            temp['MEAN_2'] = word
            temp['Volt_2'] = volt
            results = results.append(temp, ignore_index=True)
        else:
            temp['temp'] = tmp
            temp['Vin_real_3'] = vin_real
            temp['Vin_3'] = PS_VOLT
            temp['SLOPE_3'] = word
            temp['MEAN_3'] = word
            temp['Volt_3'] = volt
            results = results.append(temp, ignore_index=True)

results.to_csv(filename)
plt.plot(results['SLOPE'],results['Volt'], 'r')
plt.plot(results['SLOPE_2'],results['Volt_2'], 'b')
plt.plot(results['SLOPE_3'],results['Volt_3'], 'k')
plt.xlabel('Slope/Mean')
plt.ylabel('bandgap [V]')
plt.title('Bandgap measurement of TP'+str(TP)+' at %2.0f°C'%tmp)
plt.grid(visible=True, which='major', color='grey', linestyle='--')
plt.legend(['Vin='+str(ps_volts[0])+'V', 'Vin='+str(ps_volts[1])+'V', 'Vin='+str(ps_volts[2])+'V'])
#ps_agilent.write('SYST:BEEP 1000,0.7')
plt.show() 





