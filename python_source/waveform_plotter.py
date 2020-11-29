
#import matplotlib
#matplotlib.use('WXAgg',warn=False, force=True)
from matplotlib import pyplot as plt
#print ("Switched to:",matplotlib.get_backend())

#For plotting adc waveforms
def plot_adc_waveform(data):
    
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
def plot_dac_waveforms(channels):
    
    scale = 1800/0x7FFF
    
    fig = plt.figure()
    
    for c in channels:
    
        #Skip this channel if it's an ADC channel
        if(c.type == "ADC"):
           continue
        
        #Figure out when the waveform is over
        waveform_length = (c.period*c.num_repeat_cycles)
        t_last = c.pre_delay + waveform_length + c.post_delay
        #Set up our plot lists
        t_now = 0 #in ns
        t = []
        wave = []
        
        #Figure out the starting position of the waveform
        wave_pos = 0
        for m in c.mask_samples:
           #If we see something not masked out then this is where the waveform starts
           if(m):
               break
           wave_pos += 1
        
        while(t_now < t_last):
           
           #Append the current time to our times list
           t.append(t_now)
           
           #If we're in pre_delay
           if(t_now < c.pre_delay):
               #append a 0
               wave.append(0)
           #If we're in the waveform 
           elif(t_now < c.pre_delay + waveform_length):
               #Append a waveform sample
               wave.append(c.waveform_samples[wave_pos] * scale)
               #Wrap around our index if need be
               if(wave_pos == len(c.waveform_samples)-1):
                   wave_pos = 0
               else:
                   wave_pos += 1
           #Must be in post delay
           else:
               wave.append(0)
            
           t_now += 0.25
           
        plt.plot(t, wave, label="channel " + str(c.channel_num + 1))
    
    
    ax = plt.gca()
    
    ax.set(xlabel='Time (ns)', ylabel='Voltage (mV)', title='DAC Waveforms')
    #ax.grid()
    plt.legend(loc='upper left')
   
    #fig.savefig("test.png")
    plt.show()

        
        
        