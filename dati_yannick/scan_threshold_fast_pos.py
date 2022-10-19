'''
Charge scan for LIN AFE prototype
author: Luigi Gaioni
University of Bergamo
Nov. 2018


Notes for tester:
1.
'''


import matplotlib.pyplot as plt
import tables as tb
import numpy as np
from scipy import stats
import random
import progressbar
import scipy.special
from scipy import optimize
from scipy.optimize import curve_fit
from time import sleep
import visa



def main():
    
    rm = visa.ResourceManager()
    #print(rm.list_resources())
    # set-up instruments - power source, multimeter
    mm = rm.open_resource('GPIB0::23::INSTR', write_termination='\n')
    power = rm.open_resource('GPIB0::5::INSTR', write_termination='\n')
    
    f = open("threshold_scan.txt", "a")

    
    # number of avg
    avg=3
    
    # start, stop and step value for vth
    vth_start=362
    vth_stop=440
    vth_step=1
    nstep=int( (vth_stop-vth_start)/vth_step)
    
    threshold=0
    
    
    # starting value of vth in V
    vth=vth_start/1000.0
    
    
    # start sweeping cal_hi
    for j in range(nstep):
        
        #set vth
        str_ps= "APPL P6V, "+str(vth)+", 0.1"
        power.write(str_ps)
        power.write("OUTP:STAT ON")
        sleep(0.1)
        
        #xaxis.append(vth)
        
        # set hit-efficiency to 0
        #hit_eff=0
        mean_comp_out=0
        
        # trigger the scope num_pulses times to readout the comparator output
        for i in range(avg):
            sleep(0.05)
            comp_out=float(mm.query("MEAS:VOLT:DC? 10,0.003"))
            mean_comp_out=mean_comp_out + comp_out
 
        mean_comp_out=mean_comp_out/avg

        if (mean_comp_out < 1.05):
            threshold=vth
            f.write('%.3f\n' % (threshold))
            break
                
        vth = vth + (vth_step/1000.0)
    

    print("Threshold: %f\n" % threshold)



if __name__ == '__main__':

    main()

