# Author: Yannick Konstandin
# University of Bergamo
# June/2022
# bandgap voltage
# set power-supply
# read output from multimeter
# plot data
# create csv-file

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

#############################################
# this must be changes manually
TP = 16      # testpoint
tmp = 70    # temperature
VCC = 2.5   # VCCIN
#############################################

# Pop-up
top = Tk()
top.geometry(f"200x10+{800}+{400}") # size and position of window
tkinter.messagebox.showinfo('Slope and mean set to 7?','Starting measurement of TP'+str(TP)+' at '+str(tmp)+'°C.')
top.destroy()

plt.close("all")
rm = pyvisa.ResourceManager('@py')
ps_agilent = rm.open_resource('USB0::2391::36632::MY52350174::0::INSTR')
agilent = Agilent34461A(rm)

#volt = agilent.get_voltage()
#print('Voltage:', volt, 'V')

header = ['set voltage', 'bandgap voltage','Temperature']

# define voltage range and steps
volt_in = np.arange(0,1.33,0.01) # increase VDDA from 0-1.32V
#volt_in = np.arange(1.32,-0.01, -0.01) # decrease VDDA from 1.32V-0V
results = pd.DataFrame()

for voltage in volt_in:
  ps_agilent.write('VOLT %1.2f' % voltage)
  ps_agilent.write('SENS:CURR:PROT 2') #compliance in A
  time.sleep(0.5)
  print('Vin: %1.3f' % voltage)
  vin_real = float(ps_agilent.query('MEAS:VOLT:DC?'))
  print('Vin real: %1.3f' % vin_real)
  voltage_dec = decimal.Decimal(voltage)
  
  temp = {}
  temp['Vin'] = float(voltage)
  temp['Vin_real'] = vin_real
  temp['Vout'] = agilent.get_voltage_rang_1()
  temp['temp'] = tmp
  temp['VCC']  = VCC
  results = results.append(temp, ignore_index=True)

if tmp < 0:
    temper = tmp*-1
    results.to_csv('/home/microlab/Documenti/Python_scripts/Band_gap/VIN_VOUT/Results_TP'+str(TP)+'_TEMP_m'+str(temper)+'_0_UP.csv')
else:
    results.to_csv('/home/microlab/Documenti/Python_scripts/Band_gap/VIN_VOUT/Results_TP'+str(TP)+'_TEMP_'+str(tmp)+'_0_UP.csv')

#x = np.linspace(0, 1.4, 1)
plt.plot(results['Vin'],results['Vout'], 'ro')
plt.xlabel('Vin [V]')
plt.ylabel('bandgap [V]')
plt.title('Bandgap measurement')
plt.grid(b=True, which='major', color='grey', linestyle='--')
#change this
plt.legend(['TP'+str(TP)+' at '+str(tmp)+'°C'])
ps_agilent.write('SYST:BEEP 1000,0.7')
plt.show() 














































