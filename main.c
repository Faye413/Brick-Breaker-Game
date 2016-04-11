#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"

//paddle(player)
PADDLE paddle;
//Ball
BALL ball;
//Bricks 
BRICK bricks[40];
int brickCount;
int state;
int seed;
int score;
int oldScore;

// STATES
enum { SPLASHSCREEN, GAMESCREEN, LOSESCREEN, WINSCREEN, PAUSESCREEN };

unsigned int buttons;
unsigned int oldButtons;

int main()
{       
	initialize();  
	while(1)
	{
		oldButtons = buttons;
        buttons = BUTTONS;
                
        // Put your switch statement here!
        switch(state)
        {
        	case SPLASHSCREEN:
        	    start();
        	    break;
        	case GAMESCREEN: 
                game();
                break; 
            case PAUSESCREEN: 
                pause();
                break; 
            case WINSCREEN: 
                win();
                break; 
            case LOSESCREEN:
                lose();
                break;
        }
               
	}

	return 0;
}

void start()
{
    // Write the code for the buttons here
    // This is also where you will be seeding the random number
    // Increment a value and pass it to srand when you change states
    
    if (BUTTON_PRESSED(BUTTON_START))
    {
    	//initializeGame();
    	fillScreen(BLACK);
        initializeGame();
    	state = GAMESCREEN;
    	
    }
    seed++; 
    srand(seed);
        
}

void game()
{
    update();
    waitForVblank();
    draw();

    if (BUTTON_PRESSED(BUTTON_START))
    {
    	state = PAUSESCREEN;
    	fillScreen(GREY);
        char str[80];
        sprintf(str, "Game paused. Press START to start again"); 
        drawString(5, 0, str, WHITE);
    }
    if (BUTTON_PRESSED(BUTTON_A)||(score==40))  //press A to win as a shortcut 
    {
    	state = WINSCREEN;
    	fillScreen(GREEN);
    	char str[80];
        sprintf(str, "You win!"); 
        drawString(5, 0, str, WHITE);
    }
    if (paddle.dead)
    {
    	state = LOSESCREEN;
    	fillScreen(RED);
    	char str[80];
        sprintf(str, "Sorry. You lose."); 
        drawString(120, 0, str, WHITE);
    }
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
    	fillScreen(BLUE);
        char str[80];
        sprintf(str, "Welcome! Press START to start"); 
        drawString(5, 0, str, WHITE);
    	state = SPLASHSCREEN; 	
    }
    
}

void pause()
{
	// TODO Write the code for the buttons here
	
	if (BUTTON_PRESSED(BUTTON_START))
    {
    	fillScreen(BLACK); //to cover the grey
    	state = GAMESCREEN;
    }

    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
    	state = SPLASHSCREEN;
    	fillScreen(BLUE);
        char str[80];
        sprintf(str, "Welcome! Press START to start"); 
        drawString(5, 0, str, WHITE);
    }
    
}

void win()
{
    // TODO Write the code for the buttons here
    // TODO display the top score on this screen as well as its address
    // Hint: You may not want draw text every frame
    // 		 Try drawing it when transitioning here
 
    
    if (BUTTON_PRESSED(BUTTON_START))
    {
    	state = SPLASHSCREEN;
    	fillScreen(BLUE);
        char str[80];
        sprintf(str, "Welcome! Press START to start"); 
        drawString(5, 0, str, WHITE);
    }

}

void lose()
{
    // TODO Write the code for the buttons here
    // Hint: You may not want draw text every frame
    // 		 Try drawing it when transitioning here 
    if (BUTTON_PRESSED(BUTTON_START))
    {
    	state = SPLASHSCREEN;
    	fillScreen(BLUE);
        char str[80];
        sprintf(str, "Welcome! Press START to start"); 
        drawString(5, 0, str, WHITE);

    }
}

void initialize()
{
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    state = SPLASHSCREEN;

    fillScreen(BLUE);
    char str[80];
    sprintf(str, "Welcome! Press START to start"); 
    drawString(5, 0, str, WHITE);
 

}

void initializeGame()
{
    //drawRect(0, 0, 120, 240, BLACK);
    fillScreen(BLACK);

    score =0;
    oldScore = score;

    //ball
    ball.row= 80;    
    ball.col = 120;
    ball.rd = 1;
    ball.cd = 1;
    ball.size = 5;
    ball.oldrow = 80;
    ball.oldcol = 120;


    //paddle 
    paddle.paddle_row = 0;
    paddle.paddle_col = 120;
    paddle.paddle_sizel = 70;
    paddle.paddle_sizew = 10;
    paddle.paddle_row_old = 0;
    paddle.paddle_col_old = 120;
    paddle.dead = 0; 

    //brick draw logic 
    brickCount = (sizeof(bricks)/sizeof(bricks[0]));
   
    u16 cols[] = {RED, GREEN, BLUE, MAGENTA, CYAN, YELLOW, WHITE};
    int numcolors = sizeof(cols)/sizeof(cols[0]);

    int count=0;    
    for(int row = 120; row<160; row+= 10) //4 rows
    {
        for(int col = 20; col<240; col+=22)  //10 cols
        {
            bricks[count].active = 1; // active
            bricks[count].tobeerased = 0; 
            bricks[count].row = row;
            bricks[count].col = col; 
            bricks[count].color = cols[col%numcolors]; 
            bricks[count].width = 20;
            bricks[count].height = 8;
            bricks[count].oldRow = bricks[count].row;
            bricks[count].oldCol = bricks[count].col;
            
            count ++;

            if(count == 40)
            {
                break;
            }
        }

        if(count == 40)
        {
            break;
        }
    }
                
    
}

void update()
{
    paddle.paddle_row_old = paddle.paddle_row;
    paddle.paddle_col_old = paddle.paddle_col;

    ball.oldrow = ball.row;
    ball.oldcol = ball.col;

    ball.row += ball.rd;
    ball.col += ball.cd;

    oldScore = score;



    //Check ball&brick collisons 
   for(int i = 0; i<=brickCount; i+=1)
    {
        BRICK * b = &bricks[i];
        if(bricks[i].active)
        {
            collisionCheckBrickBall(b);
        }                   
    }

    // Check for ball& wall collisions
    if(ball.row < 0)                
    {
        ball.row = 0;
        ball.rd = -ball.rd;
    }
    if(ball.row>(159-ball.size+1))
    {
        ball.row = 159-ball.size+1;
        ball.rd = -ball.rd;
    }
    if(ball.col < 0)
    {
        ball.col = 0;
        ball.cd = -ball.cd;
    }
    if(ball.col>(239 - ball.size +1))
    {
        ball.col = 239 - ball.size + 1;
        ball.cd = -ball.cd;
    }
    
    //Check for paddle & wall collosion 
    if(BUTTON_HELD(BUTTON_LEFT))
        {  
            if(paddle.paddle_col>0)
            {
                //paddle.paddle_col--;
                paddle.paddle_col = paddle.paddle_col-2;
            }
        }
            
    if(BUTTON_HELD(BUTTON_RIGHT))
        {  
            if(paddle.paddle_col<(240-paddle.paddle_sizel))
            {
                //paddle.paddle_col++;
                paddle.paddle_col = paddle.paddle_col+2;
            }   
        }

   //Check for paddle& ball collision 
    if(ball.row < paddle.paddle_sizew)
    {
        if(((ball.col+ball.size)>paddle.paddle_col) && (ball.col<(paddle.paddle_col+paddle.paddle_sizel)))
        {
            ball.row= paddle.paddle_sizew;
            ball.rd=-ball.rd;
        }
        if(ball.row<=0)
        {
            paddle.dead=1;
        }
    }

   
}




void draw()
{
    //draw ball 
    waitForVblank();
    drawRect(ball.oldrow, ball.oldcol, ball.size, ball.size, BLACK);   
    drawRect(ball.row, ball.col, ball.size, ball.size, YELLOW);

    //draw paddle
    waitForVblank();
    drawRect(paddle.paddle_row_old,paddle.paddle_col_old, paddle.paddle_sizew, paddle.paddle_sizel, BLACK);
    drawRect(paddle.paddle_row, paddle.paddle_col, paddle.paddle_sizew, paddle.paddle_sizel, GREEN);    
               
    //draw bricks
    waitForVblank();
    for(int i = 0; i < brickCount; i++)
    {
        BRICK * b = &bricks[i];
        drawBricks(b);
    }
    for(int i = 0; i < brickCount; i++)
    {
        BRICK * b = &bricks[i];
        eraseBricks(b);
    }   
    
    //draw score
    waitForVblank();
    char str[80];
        sprintf(str, "Score: %u", score); 
        drawString(2, 0, str, WHITE);

}

void eraseBricks(BRICK* b)
{
    if((b->active == 0)&&(b->tobeerased))
        drawRect(b->oldRow, b->oldCol, b->height, b->width, BLACK);
        b->tobeerased = 0;
}

void drawBricks(BRICK* b)
{
    if(b->active)
        drawRect(b->row, b->col, b->height, b->width, b->color);
}

void eraseScore()
{
    char strover[80];
    sprintf(strover, "Score: %u", oldScore); 
    drawString(2, 0, strover, BLACK);
}

void collisionCheckBrickBall(BRICK* b)
{
    if(((ball.col+ball.size) >= b->col)&&((ball.row+ball.size) >= b->row)&&(ball.row <= (b->row+b->height))&&(ball.col<=(b->col+b->width)))
    {
        b->active = 0; //set to not active
        
        if(ball.rd<0) //ball move down 
        {
            if(ball.row == (b->row+b->height))
            {
                ball.rd = -ball.rd;
                score++;
                b->tobeerased = 1;
                eraseScore();
            }
            else
            {
                if(ball.cd>0)
                {
                    ball.cd = -ball.cd;
                    score++;
                    b->tobeerased = 1;
                    eraseScore();
                }
                else
                {
                    ball.cd = -ball.cd;
                    score++;
                    b->tobeerased = 1;
                    eraseScore();
                }
            }
        }
        else
        {
            if((ball.row+ball.size) == b->row) //ball move right up 
            {
                ball.rd = -ball.rd;
                score++;  
                b->tobeerased = 1;  
                eraseScore();          
            }
            else
            {
                if(ball.cd>0)
                {
                    ball.cd = -ball.cd;
                    score++;
                    b->tobeerased = 1;
                    eraseScore();
                }
                else
                {
                    ball.cd = -ball.cd;
                    score++;
                    b->tobeerased = 1;
                    eraseScore();
                }
            }
        }
    }

}
