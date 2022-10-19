import imp
import pyvisa
import time
from agilent_34461A import Agilent34461A#, Power_supply
from agilent_34461A import Power_supply
#rm = pyvisa.ResourceManager()
rm = pyvisa.ResourceManager('@py')
print(rm.list_resources())

#print(rm)

#pyvisa.ResourceManager().list_resources()

agilent = Agilent34461A(rm)


#power = Power_supply(rm)

#print(power.whoAmI())

#power.set_voltage()
#power.test_function()
#print(agilent.get_voltage())
#power.get_voltages()
#print(power.set_voltage())


ps_agilent = rm.open_resource('USB0::2391::36632::MY52350174::0::INSTR')
ps_agilent.write('SOUR:VOLT 5')
ps_agilent.write('SOUR:CURR 1')
ps_agilent.write('OUTP 1')
time.sleep(5)
print(agilent.get_voltage())
'''
voltage = ins_ngm202.query_ascii_values("MEAS:VOLT?")
current = ins_ngm202.query_ascii_values("MEAS:CURR?")
ins_ngm202.write("OUTP 0")
print("Voltage was "+str(voltage[0])+". Current was "+str(current[0])+".")
ins_ngm202.close()
'''