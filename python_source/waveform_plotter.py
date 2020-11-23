
#import matplotlib
#matplotlib.use('WXAgg',warn=False, force=True)
from matplotlib import pyplot as plt
#print ("Switched to:",matplotlib.get_backend())

#For plotting adc waveforms
def plot_waveform(data):
    
    if(data == None):
        print("Error, unable to plot waveform, adc bytestream was empty.")
        return
    
    fig, ax = plt.subplots()
    
    #rebuild the time array
    t = [] #in nanoseconds
    for i in range(0, len(data)):
        t.append(i*0.5)
        
    ax.plot(t, data)
    
    ax.set(xlabel='Time (ns)', ylabel='Voltage (mV)',
           title='ADC Waveform')
    ax.grid()
    
    #fig.savefig("test.png")
    plt.show()
    #plt.pause(5)
    #choice = input()
    #plt.close()
    
#IF YOU'RE HAVING PROBLEMS< REMEMBER TO ADD THE PATH LIBRARY/BIN and ANACONDA TO SYSTEM PATH
    
#channels should be an array of channels    
def plot_waveforms(channels):
    
    scale = 1800/32767
    
    try:
         fig, ax = plt.subplots()
         
         for c in channels:
             #Get the channel parameters
             pre_delay = c.
             
             #Figure out when the waveform is over
             t_last = pre_delay + waveform_length + post_delay
             #Set up our plot lists
             t_now = 0
             t = []
             wave = []
             while(t < t_last):
                
                #If we're in pre_delay
                if(t_now < pre_delay):
                    
                 
             ax.plot(t, wave, label="channel " + str(c.number+1))
         
         
         
         ax.set(xlabel='Time (ns)', ylabel='Voltage (mV)', title='DAC Waveform')
         ax.grid()
         plt.legend(loc='upper left')
        
         #fig.savefig("test.png")
         plt.show()
        
    except:
       print("Error while attempting to plot waveform data.")
        
        
        