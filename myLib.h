#ifndef MY_LIB_H
#define MY_LIB_H

typedef unsigned short u16;

#define REG_DISPCTL *(unsigned short *)0x4000000
#define MODE3 3
#define BG2_ENABLE (1<<10)

#define SCANLINECOUNTER *(volatile u16 *)0x4000006


#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define BLUE COLOR(0,0,31)
#define GREY COLOR(15, 15, 15)
#define WHITE COLOR(31,31,31)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW COLOR(31,31,0)
#define BLACK 0
#define SCREENWIDTH 240
#define SCREENHEIGHT 160
#define TEXTBORDER 10
#define OFFSET(r,c,rowlen) ((r)*(rowlen)+(c))

extern unsigned short *videoBuffer;


// Prototypes
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void waitForVblank();
void fillScreen(unsigned short color);
void initializeGame();
void eraseScore();


// *** Input =========================================================

// Buttons

#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

extern unsigned int oldButtons;
extern unsigned int buttons;

#define BUTTONS *(volatile unsigned int *)0x04000130

#define BUTTON_HELD(key)  (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~buttons & (key)))

// *** DMA =========================================================

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);

// DMA channel 3 register definitions
#define REG_DMA3SAD         *(volatile u32*)0x40000D4  // source address
#define REG_DMA3DAD         *(volatile u32*)0x40000D8  // destination address
#define REG_DMA3CNT         *(volatile u32*)0x40000DC  // control register

typedef struct
{
        const volatile void *src;
        const volatile void *dst;
        unsigned int cnt;
} DMA_CONTROLLER;

#define DMA ((volatile DMA_CONTROLLER *) 0x40000B0)

#define DMA_DESTINATION_INCREMENT (0 << 21)
#define DMA_DESTINATION_DECREMENT (1 << 21)
#define DMA_DESTINATION_FIXED (2 << 21)
#define DMA_DESTINATION_RESET (3 << 21)

#define DMA_SOURCE_INCREMENT (0 << 23)
#define DMA_SOURCE_DECREMENT (1 << 23)
#define DMA_SOURCE_FIXED (2 << 23)

#define DMA_REPEAT (1 << 25)

#define DMA_16 (0 << 26)
#define DMA_32 (1 << 26)

#define DMA_NOW (0 << 28)
#define DMA_AT_VBLANK (1 << 28)
#define DMA_AT_HBLANK (2 << 28)
#define DMA_AT_REFRESH (3 << 28)

#define DMA_IRQ (1 << 30)
#define DMA_ON (1 << 31)

typedef struct{
	int paddle_row;
	int paddle_col;
	int paddle_sizel;
	int paddle_sizew;
	int paddle_row_old;
	int paddle_col_old;
	int dead;  //treated as a player 
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
#endif