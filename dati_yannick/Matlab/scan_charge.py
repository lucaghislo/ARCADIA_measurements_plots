'''
Charge scan for LIN AFE prototype
author: Luigi Gaioni
University of Bergamo
Nov. 2018


Notes for tester:
1. make sure that LXI is enabled in the remote control of scope
2. manually configure the scope in single trigger mode
3. set trigger (S0 signal) to C3 of scope
4. connect comparator output to C2 of scope
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


def erfunc(x,th,sigma):
    return 0.5+(0.5*scipy.special.erf((x-th)/(sigma*np.sqrt(2))))


def main():
    
    rm = visa.ResourceManager()
    #print(rm.list_resources())
    # set-up instruments - function generator, power source, oscilloscope
    pattern = rm.open_resource('GPIB0::1::INSTR', write_termination='\n')
    power = rm.open_resource('GPIB0::4::INSTR', write_termination='\n')
    scope = rm.open_resource('TCPIP0::169.254.228.58')
    scope.write("TIME_DIV 20n")
    scope.write("CRMS HABS")
    scope.write("CRST HABS,7.2DIV")

    #hit efficiecny curve
    scurve=[]
    
    # number of pulses for a given input charge
    num_pulses=10
    
    # start, stop and step value for cal_hi
    cal_hi_start=510
    cal_hi_stop=550
    cal_hi_step=1
    nstep=int( (cal_hi_stop-cal_hi_start)/cal_hi_step)
    
    # Xaxis for fitting with erf
    xaxis=[]
    
    # turn-on pattern gen
    pattern.write("APPL:SQU 1000, 1.2, 0.6")
    
    # starting value of cal_hi in V
    cal_hi=cal_hi_start/1000.0
    
    # set progress bar
    bar = progressbar.ProgressBar(maxval=nstep, widgets=[progressbar.Bar('=', '[', ']'), ' ', progressbar.Percentage()])
    
    bar.start()
    
    # start sweeping cal_hi
    for j in range(nstep):
        
        bar.update(j+1)
        #set output voltage for cal_hi
        str_ps= "APPL P6V, "+str(cal_hi)+", 0.1"
        power.write(str_ps)
        power.write("OUTP:STAT ON")
        sleep(0.2)
        
        xaxis.append(cal_hi)
        
        # set hit-efficiency to 0
        hit_eff=0
        
        # trigger the scope num_pulses times to readout the comparator output
        for i in range(num_pulses):
            sleep(0.05)
            scope.write("*TRG")
            comp_out=str(scope.query("C2:CRVA? HABS"))
            
            # extract floating value from string. Increase hit_eff if comparator is fired (>0.6 V)
            list=comp_out.split(',')
            if((float(list[2][:-2])) > 0.3):
                hit_eff=hit_eff+1
    
        hit_eff=float(hit_eff*1.0/num_pulses)
        #print(hit_eff1)
        scurve.append(hit_eff)
        cal_hi = cal_hi + (cal_hi_step/1000.0)

    bar.finish()
    
    #scurve1=np.multiply(scurve,1/num_pulses)

    # fitting of the s-curve
    param, pcov = curve_fit(erfunc, xaxis, scurve,p0=[cal_hi_start/1000.0 + 0.001*(cal_hi_stop - cal_hi_start)/2.0, 0.001])
    #print(0.001*float(cal_hi_stop - cal_hi_start)/2.0)
    #param, pcov = curve_fit(erfunc, xaxis, scurve,p0=[0.58, 0.001])

    # threshold and noise from s-curve fitting
    threshold=param[0]
    noise=param[1]
    
    print("Threshold: %f\n" % threshold)
    print("Noise: %f\n" % noise)
    
    # plot s-curve and fitting
    fitdata=[]
    for i in range(nstep):
        fitdata.append(erfunc(xaxis[i],threshold,noise))

    plt.plot(xaxis, scurve, '*', xaxis, fitdata)
    plt.show()



if __name__ == '__main__':

    main()

