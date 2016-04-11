# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"






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
# 8 "text.c" 2
# 1 "text.h" 1
# 9 "text.h"
void drawChar(int , int , char , unsigned short );
void drawString(int row, int col, char *str, unsigned short color);

extern const unsigned char fontdata_6x8[12288];
# 9 "text.c" 2

void drawChar(int row, int col, char ch, unsigned short color)
{

    for(int r=0; r<8; r++)
 {
  for(int c=0; c<6; c++)
  {
   if(fontdata_6x8[((r)*(6)+(c)) + ch*48] )
   {
    setPixel(row+r, col+c, color);
   }
  }
 }
}

void drawString(int row, int col, char *str, unsigned short color)
{

    while(*str)
 {
  drawChar(row, col, *str++, color);
  col += 6;

 }
}


const unsigned char fontdata_6x8[12288] = {

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,0,1,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
# 92 "text.c"
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,0,0,1,1,
1,1,0,0,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,0,0,0,0,1,
1,0,1,1,0,1,
1,0,1,1,0,1,
1,0,0,0,0,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,1,1,1,
0,0,0,0,1,1,
0,0,1,1,0,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,1,0,1,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,1,1,0,0,
0,1,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,1,1,0,1,
0,0,1,0,1,1,
0,0,1,1,0,1,
0,0,1,0,1,1,
0,1,1,0,1,1,
0,1,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,0,1,0,1,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,0,1,1,1,0,
0,1,0,1,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,1,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,1,
0,0,1,1,1,0,
0,0,1,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,1,0,
0,0,1,1,1,0,
0,1,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,1,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,1,1,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,1,0,1,
0,0,0,1,0,1,
0,0,0,1,0,1,
0,0,0,1,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,1,1,0,0,
0,0,1,0,1,0,
0,0,0,1,1,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,1,1,1,1,1,
0,0,0,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,1,1,1,1,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,1,1,
0,1,1,0,1,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,0,0,
0,0,0,0,1,0,
0,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,1,
0,1,1,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,1,1,
0,1,0,0,1,1,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,
0,1,0,1,0,1,
0,1,0,0,1,0,
0,0,1,1,0,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,1,1,
0,1,0,1,0,1,
0,1,1,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,0,1,1,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,1,0,
0,0,1,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,1,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,

0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,0,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,1,1,1,
0,1,0,1,0,1,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,0,1,0,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,1,0,1,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,1,0,0,1,
0,1,0,1,0,1,
0,1,0,0,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,0,1,0,
0,0,1,1,0,1,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,

0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,
0,0,1,1,1,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,0,0,0,
0,0,0,1,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,0,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,1,1,0,
0,0,1,0,0,1,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,1,1,0,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,1,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,0,0,

0,1,0,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,1,0,1,
0,1,1,1,1,1,
0,1,0,1,0,0,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,0,0,0,

0,1,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,1,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,1,
0,1,0,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,0,1,0,
0,1,0,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,0,1,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,1,0,1,0,
0,1,0,1,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,0,1,0,1,1,
0,1,0,1,0,1,
0,0,0,1,1,1,
0,0,0,0,0,1,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,0,1,
0,1,0,0,1,0,
0,0,1,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,0,1,0,0,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,1,
0,0,0,0,0,0,
1,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,1,0,1,
0,0,0,0,0,0,
1,0,1,0,1,0,
0,0,0,0,0,0,

0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,

1,0,1,0,1,0,
1,1,1,1,1,1,
0,1,0,1,0,1,
1,1,1,1,1,1,
1,0,1,0,1,0,
1,1,1,1,1,1,
0,1,0,1,0,1,
1,1,1,1,1,1,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,0,0,
0,0,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
1,1,0,1,1,1,
0,0,0,0,0,0,
1,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,

1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,

1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,

1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,

1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,

0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,0,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,0,1,1,0,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,0,0,0,
1,0,0,1,1,0,
1,0,0,0,0,1,
1,0,0,0,0,0,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,1,1,
0,1,1,0,0,1,
1,0,0,0,0,1,
0,0,0,0,0,1,
1,1,1,1,1,1,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,

1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,

1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,

1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,

1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
1,1,0,0,1,0,
1,1,0,0,1,1,
1,1,1,1,1,0,
0,0,1,1,1,1,

0,1,0,0,1,0,
1,1,1,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
1,1,1,1,1,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
};