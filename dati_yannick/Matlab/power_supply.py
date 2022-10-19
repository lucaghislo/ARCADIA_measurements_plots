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

        self.gpib = res_manager.open_resource(address)
        print(self.gpib.query('*IDN?'))
        self.gpib.write('*RST')
        self.gpib.write('*CLS')
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
        #Configure output channel 1
    
        #set_value = (self.gpib.query('VOLT 6.95566 '))
        set_output = float(self.gpib.query('OUTP ON'))
        #print('\nchannel 1 set to 10 V \n')

    def get_voltages(self,scaled=False,query_range=10,resolution=0.00001):
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
            print('Voltage:')
            return val

    def test_function(self):
        print('Test works')

    def get_voltage(self,query_range=10,resolution=0.00001):
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