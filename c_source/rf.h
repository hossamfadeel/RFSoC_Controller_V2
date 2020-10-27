/*
 * rf.h
 *
 *  Created on: Jun 26, 2019
 *      Author: Marandi Group B241
 */

#ifndef SRC_DRIVERS_RF_H_
#define SRC_DRIVERS_RF_H_


#include "xrfdc.h"
#include "xparameters.h"


XRFdc RFdcInst;      /* RFdc driver instance */



/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define RFDC_DEVICE_ID 	XPAR_XRFDC_0_DEVICE_ID
#ifndef __BAREMETAL__
#define BUS_NAME        "platform"
#define RFDC_DEV_NAME    "a0000000.usp_rf_data_converter"
#endif


//Core defines
#define ADC_BUFFER_DEPTH 65536
//Core functions
u8 rf_init();
u8 rf_get_adc_clock_status();
u8 rf_get_dac_clock_status();
int rf_self_test();

#endif /* SRC_DRIVERS_RF_H_ */
