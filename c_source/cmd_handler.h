

#ifndef _CMD_HANDLER_H_
#define _CMD_HANDLER_H_

#include "xgpio.h"

//Function headers/////////////////////

//Entry point for embedded ARM processor
void cmd_handler_handoff();

void cmd_handle_command();

u8 cmd_init();

void update_led_state();
///////////////////////////////////////


#endif
