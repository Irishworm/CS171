int x=250;                                 //X-axis pos. of ball
int direction_x=2;                         // Change in x-axis pos. of ball each time draw() executed
int y=150;                                 // Y-axis pos. of ball
int direction_y=2;                           // Change in y-azis pos. of ball each time draw() executed

int lives=3;                                 //Rght hand side score
int score=0;                                 //Left hand side start score

void setup()
{
 size(400,400);                             
}
void draw()
{
 background(255,255,255);                  
  
 fill(0,255,0);                          
 rect(380,mouseY-50,20,120);                // Making paddle move with mouse

 fill(255,0,0);
 ellipse(x,y,20,20);                   
 
 y=y+direction_y;                           // Update new pos.
 if(y<10) direction_y=-direction_y;         // Change direction if it hit the side of screen
 if(y>(width-10)) direction_y=-direction_y; //change x to y to change pos. of paddle

 x=x+direction_x;
 if(x<10) direction_x=-direction_x;         // Change direction if it hit other the side of screen
 if(x>(height-10)) direction_x=-direction_x;//changed y to x to change pos. of paddle

 if(x>(height-10))                           //When the ball hits the side it misses and :
 
 {
 direction_x=-direction_x;                  // Makes ball bouce
 x=30;                                      // Makes the ball go back to other side if hits paddle from wrong side(should stop glitch)
 lives--;                                   // Makes life go down when ball hits right side of screen
 if(lives==0) exit();                       // Stops game when right side score hits 0
 }

 if((x>(height-30))&&(abs(mouseY-y)<60))    // When the ball hits the paddle it :

 {
 direction_x=-direction_x;                 // Makes ball bounce
 score++;                                  // Increases left life go down when ball hits paddle
 }

 textSize(32);
 fill(0,0,255);
 
 text(score, 10, 30);                     // Display score
 text(lives,width-30, 30);                // Display lives
} 
