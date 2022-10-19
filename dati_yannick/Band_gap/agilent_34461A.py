#import visa
import time
import sys
import math

class Agilent34461A(object):
    '''
    This class models the Agilent 34401A Multimeter.
    '''

    def __init__(self,res_manager,address='USB0::10893::5121::MY57212554::0::INSTR'):
        '''
        Constructor method

        :param res_manager: PyVisa resource manager
        :type res_manager: PyVisa resourceManager object
        :param address: SCPI address of instrument
        :type address: string
        '''
        self.active = False

        self.gpib = res_manager.open_resource(address)
        print(self.gpib.query('*IDN?'))
        self.gpib.write('*RST')
        self.gpib.write('*CLS')
        self.scalingfactor = 1

    def whoAmI(self):
        ''':returns: reference to device'''
        return 'DCMeter'


    def change_state(self):

        if self.active == True:
            self.active = False
        else:
            self.active = True


    def get_voltage(self,scaled=False,query_range=1,resolution=0.00001):
        '''
        Queries the voltage of multimeter.

        :param scaled: Optional scaling
        :type scaled: Boolean
        :param query_range: range for query
        :type query_range: Integer
        :param resolution: resolution for query
        :type resolution: Float
        :returns: current voltage reading as float
        '''

        val = float(self.gpib.query('MEAS:VOLT:DC? '+str(query_range)+','+str(resolution)))
        if scaled==True:
            val = val*self.scalingfactor
        print('Voltage: ', val,'V\n')
        return val

    def get_voltage_rang_1(self,scaled=False,query_range=1,resolution=0.000001):
            '''
            Queries the voltage of multimeter.

            :param scaled: Optional scaling
            :type scaled: Boolean
            :param query_range: range for query
            :type query_range: Integer
            :param resolution: resolution for query
            :type resolution: Float
            :returns: current voltage reading as float
            '''

            val = float(self.gpib.query('MEAS:VOLT:DC? '+str(query_range)+','+str(resolution)))
            if scaled==True:
                val = val*self.scalingfactor
            print('Voltage: ', val,'V')
            return val


    def get_current(self,query_range=1,resolution=0.000001):
        '''
        Queries the current reading of the multimeter

        :param query_range: range for query
        :type query_range: Integer
        :param resolution: resolution for query
        :type resolution: Float
        :returns: current reading as float
        '''
        return float(self.gpib.query('MEAS:CURR:DC? '+str(query_range)+','+str(resolution)))


    def get_feedback(self):
        '''
        Requirement for generic feedback
        '''
        return self.get_current()


    def set_scaling(self,factor=1):
        '''
        Sets the scaling factor of the multimeter instrument.

        :param factor: Desired factor
        :type factor: Float or Integer
        '''

        self.scalingfactor = factor


    def get_scaling(self):
        '''
        Gets the scaling factor.

        :returns: Scaling factor as Int or Float
        '''

        return self.scalingfactor



    def close(self):
        '''
        Release resource.
        '''

        self.gpib.close()

##################################################################################################
#new class
##################################################################################################

class Power_supply(object):
    '''
    This class models the Agilent B2961A power-supply.
    '''

    def __init__(self,res_manager,address='USB0::2391::36632::MY52350174::0::INSTR'):
        '''
        Constructor method

        :param res_manager: PyVisa resource manager
        :type res_manager: PyVisa resourceManager object
        :param address: SCPI address of instrument
        :type address: string
        '''
        self.active = False
        self.usb = res_manager.open_resource(address)
        print(self.usb.query('*IDN?'))
        self.usb.write('*RST')
        self.usb.write('*CLS')
        self.scalingfactor = 1

    def whoAmI(self):
        ''':returns: reference to device'''
        return 'Power supply\n'

    ''' works with warnings
    def set_voltage(self, query_range =10, resolution=0.0001):
        #Configure output channel 1
    
        set_value = float(self.gpib.query('VOLT 6.5 '))
        set_output = float(self.gpib.query('OUTP ON'))
        print('\nchannel 1 set to 10 V \n')
        '''

    def set_voltage(self):
        ps_agilent = self.usb
        #ps_agilent.write('OUTP:PROT 1') # turn on protection mode
        ps_agilent.write('SENS:CURR:PROT 0.2') #compliance in A
        ps_agilent.write('VOLT 1.2; VOLT:RANG 10')
        ps_agilent.write('OUTP 1')
        time.sleep(1)
        return print('Voltage set successfully :-)')
        

    def turn_off_ps(self):
        ps_agilent = self.usb
        ps_agilent.write('OUTP 0')
    
    def sound(self):
        ps_agilent = self.usb
        ps_agilent.write('SYST:BEEP 1000,0.7')



