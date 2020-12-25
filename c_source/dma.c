#include "xaxidma.h"
#include "xparameters.h"

#include "dma.h"


/*
 * Device instance definitions
 */
XAxiDma AxiDma;

//DMA buffer definitions

#define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID

#ifdef XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#elif defined (XPAR_MIG7SERIES_0_BASEADDR)
#define DDR_BASE_ADDR	XPAR_MIG7SERIES_0_BASEADDR
#elif defined (XPAR_MIG_0_BASEADDR)
#define DDR_BASE_ADDR	XPAR_MIG_0_BASEADDR
#elif defined (XPAR_PSU_DDR_0_S_AXI_BASEADDR)
#define DDR_BASE_ADDR	XPAR_PSU_DDR_0_S_AXI_BASEADDR
#endif


#ifndef DDR_BASE_ADDR
#warning CHECK FOR THE VALID DDR ADDRESS IN XPARAMETERS.H, \
		 DEFAULT SET TO 0x01000000
#define MEM_BASE_ADDR		0x01000000
#else
#define MEM_BASE_ADDR		(DDR_BASE_ADDR + 0x1000000)
#endif

#define TX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00100000)
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00300000)
#define RX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x004FFFFF)

#define MAX_PKT_LEN 0x20

#define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID


#define DMA_MAX_TRIES 10000 //How many cycles the CPU will wait for DMA transfer to finish before giving up

u8 *TxBufferPtr;
u8 *RxBufferPtr;

void dma_reset()
{
	XAxiDma_Selftest(&AxiDma);
}

//Retuns 0 on success
u8 dma_init()
{
	int Status;

	TxBufferPtr = (u8 *)TX_BUFFER_BASE;
	RxBufferPtr = (u8 *)RX_BUFFER_BASE;
	
	XAxiDma_Config *CfgPtr;

	/* Initialize the XAxiDma device.
	 */
	CfgPtr = XAxiDma_LookupConfig(DMA_DEV_ID);
	if (!CfgPtr) {
		xil_printf("No config found for %d\r\n", DMA_DEV_ID);
		return XST_FAILURE;
	}

	Status = XAxiDma_CfgInitialize(&AxiDma, CfgPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}

	if(XAxiDma_HasSg(&AxiDma)){
		xil_printf("Device configured as SG mode \r\n");
		//return XST_FAILURE;
	}
	
	/* Disable interrupts, we use polling mode
	 */
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DMA_TO_DEVICE);
	return 0;
}

//Returns 0 on success
//Writes an entire dac word (8 32-bit words)
u8 dma_write_word(u32* words)
{
	//Force a cache reload
	Xil_DCacheFlushRange((UINTPTR)TxBufferPtr, MAX_PKT_LEN);
	
	u32* tx_buff_ptr = (u32*) TxBufferPtr;

	for(int i = 0; i < 8; i++)
	{
		tx_buff_ptr[i] = words[i];
	}

	//Start the transfer
	int Status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR) TxBufferPtr,
					8*4, XAXIDMA_DMA_TO_DEVICE);
	//Wait for the transfer to finish
	int count = 0;
	while(XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE))
	{
		count++;
		if(count > DMA_MAX_TRIES)
		{
			return 1;
		}
	}
	
	if (Status != XST_SUCCESS) {
			return 1;
	}
	return 0;
}

//Returns 0 on success, word returned through argument pointer
u8 dma_read_word(u32* dma_ret_val)
{
	
	//Flush the buffer and force a cache reload
	Xil_DCacheFlushRange((UINTPTR)RxBufferPtr, MAX_PKT_LEN);
	//Xil_DCacheInvalidateRange((UINTPTR)RxBufferPtr, MAX_PKT_LEN);
	
	//Start the transfer
	int Status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR) RxBufferPtr,
			MAX_PKT_LEN, XAXIDMA_DEVICE_TO_DMA);
	//Wait for the transfer to finish
	int count = 0;
	while(XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA))
	{
		count++;
		if(count > DMA_MAX_TRIES)
		{
			*dma_ret_val = 0;
			return 1;
		}
	}
	
	*dma_ret_val = ((u32*) RxBufferPtr)[0];
	
	if (Status != XST_SUCCESS) {
			return 1;
	}
	return 0;
}



