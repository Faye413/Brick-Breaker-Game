# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 28 "myLib.h"
extern unsigned short *videoBuffer;



void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void waitForVblank();
void fillScreen(unsigned short color);
void initializeGame();
void eraseScore();
# 55 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 65 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef struct
{
        const volatile void *src;
        const volatile void *dst;
        unsigned int cnt;
} DMA_CONTROLLER;
# 103 "myLib.h"
typedef struct{
 int paddle_row;
 int paddle_col;
 int paddle_sizel;
 int paddle_sizew;
 int paddle_row_old;
 int paddle_col_old;
 int dead;
} PADDLE;

typedef struct{
 int row;
 int col;
 int rd;
 int cd;
 int size;
 int oldrow;
 int oldcol;
} BALL;

typedef struct{
    int row;
 int col;
 int oldRow;
 int oldCol;
 int height;
 int width;
 int rd;
 int cd;
 int active;
 u16 color;
 int tobeerased;
} BRICK;

void setPixel(int, int, unsigned short);
void drawRect(int row, int col, int height, int width, unsigned short color);
void drawRectInBounds(int row, int col, int height, int width, unsigned short color);
void waitForVBlank();
void initialize();
void draw();
void update();
void eraseBricks(BRICK* b);
void drawBricks(BRICK* b);
void collisionCheckBrickBall(BRICK* b);
void start();
void game();
void pause();
void win();
void lose();
# 2 "myLib.c" 2

unsigned short *videoBuffer = (u16 *)0x6000000;

void setPixel(int row, int col, unsigned short color)
{
 videoBuffer[((row)*(240)+(col))] = color;
}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{

 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].src = source;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].dst = destination;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].cnt = (1 << 31) | control;

}

void drawRect(int row, int col, int height, int width, unsigned short color)
{
 volatile unsigned short c = color;



 int i;
 for(i = 0; i < height; i++)
 {
  DMANow(3, &c, &videoBuffer[((row+i)*(240)+(col))], (width) | (2 << 23));
 }

}

void fillScreen(unsigned short color)
{
 volatile unsigned short c = color;


 DMANow(3, &c, videoBuffer, (240*160) | (2 << 23));

}

void waitForVblank()
{
 while(*(volatile u16 *)0x4000006 > 160);
 while(*(volatile u16 *)0x4000006 < 160);
}
