


::Initialize the driver 

python init_board.py COM5 1

::Add a single DAC channel

python add_channel.py 1 test_waveforms\sawtooth.txt 16 20 1 5 4.25 0

::Add the accompanying locking channel

python add_channel.py 1 sand 1 0 1 1 0 1 1 1.25 test_waveforms\10_dc_square_wave.txt

::Arm the board with and adc shift of 2 and 100 capture cycles

python arm_board.py 400 1 2

::Trigger the board as many times as needed

python trigger_board.py 0 1