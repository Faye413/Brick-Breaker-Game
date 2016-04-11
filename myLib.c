#include "myLib.h"

unsigned short *videoBuffer = (u16 *)0x6000000;

void setPixel(int row, int col, unsigned short color)
{
	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
	// COMPLETE THIS FUNCTION !!
	DMA[channel].src = source;
	DMA[channel].dst = destination;
	DMA[channel].cnt = DMA_ON | control;
	
}

void drawRect(int row, int col, int height, int width, unsigned short color)
{
	volatile unsigned short c = color;
	// Use the variable c instead of color in this function
	// COMPLETE THIS FUNCTION USING DMA!!
	
	int i;
	for(i = 0; i < height; i++)
	{
		DMANow(3, &c, &videoBuffer[OFFSET(row+i, col, SCREENWIDTH)], (width) | DMA_SOURCE_FIXED);
	}
       
}

void fillScreen(unsigned short color)
{
	volatile unsigned short c = color;
	// COMPLETE THIS FUNCTION USING DMA!!
	// you cannot use drawRect in this function.
	DMANow(3, &c, videoBuffer, (240*160) | DMA_SOURCE_FIXED);
       
}

void waitForVblank()
{
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}