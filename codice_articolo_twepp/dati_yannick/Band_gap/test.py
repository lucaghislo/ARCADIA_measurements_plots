#import imp
from socket import VM_SOCKETS_INVALID_VERSION
import pyvisa
import time
import csv
import pandas as pd
from agilent_34461A import Agilent34461A, Power_supply
import matplotlib.pyplot as plt
import pandas as pd
import decimal
import numpy as np

#rm = pyvisa.ResourceManager()
#rm = pyvisa.ResourceManager('@py')
#print(rm.list_resources())

#agilent = Agilent34461A(rm)
#power_supply = Power_supply(rm)


#power_supply.set_voltage()

#print(agilent.get_voltage())
#power.get_voltages()
#print(power.set_voltage())
#power_supply.turn_off_ps()


results = pd.DataFrame()
header = ['set voltage', 'bandgap voltage','Temperature']
x = [1,2,3,4,5,6,7,8,9,10]
dataAsString = str(x)
with open('test.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)
 
rm = pyvisa.ResourceManager('@py')
ps_agilent = rm.open_resource('USB0::2391::36632::MY52350174::0::INSTR')
agilent = Agilent34461A(rm)

fb = open('test.csv','a+')
#fb.write(header)
fb.write(dataAsString)
# Plotting data
# x-axis values
'''
# y-axis values
y = [2,4,5,7,6,8,9,11,12,12]
  
# plotting points as a scatter plot
plt.scatter(x, y, label= "measurepoints", color= "green", 
            marker= "o", s=30)
  
plt.xlabel('set voltage [V]')
plt.ylabel('bandgap voltage [V]')
plt.title('Bandgap measurement')
plt.legend()
plt.show()


for i in range(0,10):
    temp = {}
    temp['No.'] = i +1
    temp['Vin'] = 1 +i
    temp['Vout'] = 0.01 + (i/10)
    temp['temp'] = -40 + (i*10)
    #results = pd.concat([results, pd.DataFrame(temp)])
    results = results.append(temp, ignore_index=True)




for x in range(0,15):

  ps_agilent.write('PROG:VAR h 1')
  ps_agilent.write('SENS:CURR:PROT 0.2') #compliance in A
  ps_agilent.write('VOLT 1.2; VOLT:RANG 10')
  ps_agilent.write('OUTP 1')
  voltage = ps_agilent.query('MEAS:VOLT:DC? ')
  print('Voltage set to: ', voltage)
  dataAsInt = (agilent.get_voltage())
  dataAsString = str(dataAsInt)

  fb = open('measurements.csv','a+')
  #fb.write(header)
  fb.write(dataAsString) 
  fb.write('\n')
  fb.close()
  #time.sleep(0.5)
'''
volt_in = np.arange(0,1.32,0.2)
'''
for voltage in volt_in:
  ps_agilent.write('VOLT %.3f' % voltage)
  print(voltage)
  #test = volt_in(1)
  #ps_agilent.write('LOAD ON')
  ist_voltage = ps_agilent.query('MEAS:VOLT:DC?')
  voltage_dec = decimal.Decimal(voltage)
  volt_float = float(voltage)
  time.sleep(1)
  temp = {}
  temp['Vin'] = volt_float
  temp['Vist'] = float(ist_voltage)
  temp['Vout'] = agilent.get_voltage()
  temp['temp'] = 30
  results = results.append(temp, ignore_index=True)

results.to_csv('TEST_Results_wait 1s.csv')				
plt.plot(results['temp'],results['Vout'], 'ro')
plt.grid(b=True, which='major', color='grey', linestyle='--')
plt.xlabel('Temperature [°C]')
plt.ylabel('bandgap voltage [V]')
plt.title('Bandgap measurement')
plt.legend(['at 23°C'])	
plt.show()


ps_agilent.write('VOLT 1.2')
vin_real = float(ps_agilent.query('MEAS:VOLT:DC?'))
print('Vin: 1.2')
print('Vin real: ', vin_real)



ps_agilent.write('VOLT 0.01')
vin_real = float(ps_agilent.query('MEAS:VOLT:DC?'))
print('Vin: 0.01')
print('Vin real: ', vin_real)
time.sleep(6)

voltage = float(ps_agilent.write('VOLT 0.2'))
vin_real = float(ps_agilent.query('MEAS:VOLT:DC?'))
print('Vin: 1.2')
print('Vin real: ', vin_real)
time.sleep(6)
'''



voltage = agilent.get_voltage_rang_1()

#ps_agilent.write('VOLT:RANG:AUTO 0')
#ps_agilent.write('VOLT:RANG 2')
time.sleep(3)
ps_agilent.write('VOLT 1.1')
#Power_supply.set_voltage()
#ps_agilent.write('SYST:BEEP 1000,0.7')
print('Vin: ', voltage)
vin_real = float(ps_agilent.query('MEAS:VOLT:DC?'))
print('Vin real: ', vin_real, 'V')
tp = agilent.get_voltage_rang_1()
register = x.chip.read_gcrpar('BIAS8_BGR_MEAN')
print(register)


