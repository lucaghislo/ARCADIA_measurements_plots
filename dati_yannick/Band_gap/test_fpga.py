import imp
import logging
import time
from random import random
from math import floor
from tabulate import tabulate
from pyarcadia.test import Test
from pyarcadia.sequence import SubSequence
from pyarcadia.data import Pixel
import sys
import numpy as np
from agilent_34461A import Power_supply
from agilent_34461A import Agilent34461A
import pyvisa
import pandas as pd
import csv

'''rm = pyvisa.ResourceManager('@py')
ps_agilent = rm.open_resource('USB0::2391::36632::MY52350174::0::INSTR')
agilent = Agilent34461A(rm)
x = Test()
#set output
ps_agilent.write('VOLT 1.2')
ps_agilent.write('SENS:CURR:PROT 0.2') #compliance in A
ps_agilent.write('OUTP 1')
#print('Voltage:', volt, 'V')
word_bits = np.arange(0,16,1)
x = Test()


for word in word_bits:
    # Test SPI SDO
    x.chip.write_gcrpar('BIAS0_BGR_MEAN', word)
    x.chip.write_gcrpar('BIAS0_BGR_SLOPE', word)

    #x.chip.write_gcrpar('BIAS0_BGR_MEAN', 6);
    mean0 = x.chip.read_gcrpar('BIAS0_BGR_MEAN')
    slope0 = x.chip.read_gcrpar('BIAS0_BGR_SLOPE')
    print('mean:', mean0, 'slope:', slope0)
    time.sleep(1)




# TP 1 --> Register 0
# TP 2 --> Register 1 etc.

register_mean = 'BIAS0_BGR_MEAN'
register_slope = 'BIAS0_BGR_SLOPE'
value = 0
x.chip.write_gcrpar(register_mean, value)
x.chip.write_gcrpar(register_slope, value)
time.sleep(0.1)
#x.chip.write_gcrpar('BIAS0_BGR_MEAN', 6);
#mean0 = x.chip.read_gcrpar('BIAS8_BGR_MEAN')
mean0 = x.chip.read_gcrpar(register_mean)
slope0 = x.chip.read_gcrpar(register_slope)
print('mean:', mean0, 'slope:', slope0)
agilent.get_voltage_rang_1()
print(1000*float(ps_agilent.query('MEAS:CURR?')), 'mA\n')
time.sleep(0.1)

value = 15
x.chip.write_gcrpar(register_mean, value)
x.chip.write_gcrpar(register_slope, value)
time.sleep(0.5)
#x.chip.write_gcrpar('BIAS0_BGR_MEAN', 6);
#mean0 = x.chip.read_gcrpar('BIAS8_BGR_MEAN')
mean0 = x.chip.read_gcrpar(register_mean)
slope0 = x.chip.read_gcrpar(register_slope)
print('mean:', mean0, 'slope:', slope0)
agilent.get_voltage_rang_1()
print(1000*float(ps_agilent.query('MEAS:CURR?')), 'mA')
#ps_agilent.write('OUTP 0')

TP = 2
tmp = -40
#####################################

register = TP -1
register_mean = 'BIAS'+str(register)+'_BGR_MEAN' 
register_slope = 'BIAS'+str(register)+'_BGR_SLOPE'
print(register_mean, register_slope)

# Test csv output
results = pd.DataFrame()
temp = {}
temp['TP'] = TP
results = results.append(temp, ignore_index=True)
results.to_csv('/home/microlab/Documenti/Python_scripts/Band_gap/characterization/test.csv')
'''
# Test pop-up
from tkinter import * 
import tkinter.messagebox 
'''
root=Tk() 
result=tkinter.messagebox.askquestion('Bandgap characterization','Did you change TP?')
if result=='yes':
    theLabel=Label(root,text="Starting measurement of TP at °C.") #To insert a text
    theLabel.pack()
    print(results)
else:
    root.destroy() #Closing Tkinter window forcefully.
root.mainloop()

#define the messagebox function
from tkinter import *

#showinfo
import tkinter as tk
from tkinter import messagebox as msg
my_w = Tk()
my_w.geometry(f"600x200+{600}+{400}")  # Size of the window 

msg.showinfo("Title Here ","Your info message here ")

my_w.mainloop()

from tkinter import *
import tkinter as tk
from tkinter import messagebox as msg

from tkinter import messagebox
ws = Tk()
ws.title('Bandgap measurements')
ws.geometry(f"600x200+{600}+{400}")
ws.config(bg='#5FB691')

def msg1():
    messagebox.showinfo('information', 'Hi! You got a prompt.')

Button(ws, text='start measurement', command=msg1).pack(pady=50)

ws.mainloop()
top=Tk()
 
top.geometry(f"600x200+{300}+{100}") # size and position of window
tkinter.messagebox.showinfo('Bandgap characterization',"Starting measurement of TP1 at -40°C.")
#top.mainloop()
top.destroy()

from tkinter import *
from tkinter import messagebox

ws = Tk()
ws.title('Python Guides')
ws.geometry('400x300')

def clicked():
    messagebox.showinfo('sample 2', 'this is a message to change the size of box')
    messagebox.showinfo('sample 3', ' this is the message that is larger than previous message.')

Button(ws, text='Click here', padx=10, pady=5, command=clicked).pack(pady=20)

ws.mainloop()
'''
#showinfo
import tkinter as tk
from tkinter import messagebox as msg
my_w = tk.Tk()
my_w.geometry("800x500")  # Size of the window 

msg.showinfo("Title Here ","Your info message here ")

my_w.mainloop()