
#ifndef _DMA_H_
#define _DMA_H_


//Function definitions////////////////////////

//Retuns 0 on success
u8 dma_init();
//Returns 0 on success//Writes an entire dac word (8 32-bit words)
u8 dma_write_word(u32* words);
//Returns 0 on success, word returned through argument pointer
u8 dma_read_word(u32* dma_ret_val);

void dma_reset();//Used to stop pending transactions

//////////////////////////////////////////////





#endif
