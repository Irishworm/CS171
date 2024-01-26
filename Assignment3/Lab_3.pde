
//Sound code
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim      minim;
AudioPlayer jingle;    //makes it so i can use jingle = ..
AudioPlayer hit;    //makes it so i can use hit =..


PImage scene, drop, leaf, player;    //Stores info about the images

int drop_x;
int drop_y;
int drop_count;    //Stores (x,y) drop position

int leaf_x;
int leaf_y;
int leaf_count;    //(x,y) of leafy

float frame = 0;
int player_x = 400;    //player starts in middle of screen
int direction = 0;

int score = 0, lives = 5;     //sets starting score and starting lives - changed to 5 so i could test the hit file without game ending
int quit_flag = 0;    //changes to one when game ends

void setup()
{
  size(800, 600, P2D);    //Size of window
  
  //Loading a soundfile - plays in loop
  minim = new Minim(this);
  jingle = minim.loadFile("music.wav");    //loads music file into background
  jingle.loop();    //plays music file on looop - constantly there
  
  minim = new Minim(this);
  hit = minim.loadFile("hit.wav");     //loads hit file for itens dropping - **Dont loop**
  
  scene = loadImage("Background.bmp");    //Loads image data into scene data
  
  drop = loadImage("Drop.png");    //Loads imagine of rain drop
  leaf = loadImage("Leaf2.png");    //Load in image of leaf - leaf 2 looks nicer
  player = loadImage("Running.png");   //Load player sprite
  
  textureMode(NORMAL);    //Scales texture Top Right from (0,0) to (1,1)
  blendMode(BLEND);    //mixes image infront with imagine behind it
  noStroke();    //Makes it so it does not draw a line around objects
  
  drop_x = 166+ (int)random(200);    //chooses the starting position of the drop 
  drop_y = 90;
  
  float radius = random(128);    //Leaf's starting pos.
  float angle = random(2*PI);    //Code for random pos. of leaf inside the 'leaves of trees'
  leaf_x = 584+(int) (radius*cos(angle));    // centre of ' circle' x value
  leaf_y = 216+(int)(radius*sin(angle));    //centre of ' circle' y value
  
}

void draw()
{
  background(scene);    //Displays background image
  
  float left =frame/16;
  float right =(frame+1)/16;
  
  if(direction == 1)    //swaps left and right values - reverese direction of sprite
  {
    float temp = left;
    left = right;
    right = temp;
  }
  
   pushMatrix();     // Draw player
   translate(player_x,360);
   beginShape();
   texture(player);
   vertex( 0, 0, left, 0);
   vertex(130, 0, right, 0);
   vertex(130, 130, right, 1);
   vertex( 0, 130, left, 1);
   endShape(CLOSE);
   popMatrix();     // Resets origin 
  
  pushMatrix();    //Stores current location of origin
  translate(drop_x, drop_y);    //Changes origin for drawing (drop_x, drop_y)
  
  beginShape();    //Opens graphics pipeline
  texture(drop);    //Tells GPU to use the drop to texture the polygon
  vertex(-25, -25, 0, 0);    //Loads vertex dta (x,y) and (U,V) texture date into the GPU
  vertex(25, -25, 1, 0);    //Square centered on (0,0) with a width 40 and height 40
  vertex(25, 25, 1, 1);    //?Textured? with the image of the drop - had forgotten this line and bit of rain drop didnt load in - fixed
  vertex(-25, 25, 0, 1);   
  endShape(CLOSE);    //This tells GPU that i've loaded the shape into memory
  popMatrix();    //Should recover the origin - top left hand corner
  
  
  pushMatrix();    //Draws the leaf
  translate(leaf_x, leaf_y);
  rotate((float)frameCount/10);    //make it spinn
  beginShape();    //draws leaf
  texture(leaf);
  vertex(-20, -20, 0, 0);    //VVVV load, square and texture
  vertex(20, -20, 1, 0);
  vertex(20, 20, 1, 1);
  vertex(-20, 20, 0, 1);
  endShape(CLOSE);  // Loaded into memory
  popMatrix();
  
  
  drop_y +=2;    //Makes drop fall down the screen - 2FPS
  if (drop_y > 475)    //Y value is the drop 'entering' the top line or grass
  {
    drop_x = 166+(int)random(200);    //Resets the drop back to the cloud when it hits the grass
    drop_y = 90;
    
    lives--;    //life is lost - drop hits ground
    hit.play();    //does hit sound when drop hits ground 
    hit.rewind();    //needed if i wanted the hit sound to play every time
  } 
 
    
    leaf_y +=1;    //leaf falling down screen
    if(leaf_y > 475)
    {
      float radius = random(128);    //leafs starting pos.
      float angle = random(2*PI);
      leaf_x=584 +(int)(radius*cos(angle));
      leaf_y=216 +(int)(radius*sin(angle));
      
      lives--;    //life is lost - leaf hits ground
      hit.play();    //does hit sound when leaf hits ground 
      hit.rewind();    //need if i wanted hit sound to keep playing with evry miss
    }
    
    //COde for moving player - have problem: try trying to change direction and press arrow key before realising other arrow key, 
    //sprite will change direction but will run with wrong arrow key
    //sprite will sometimes disappear, fixes itself once sprite moves again
    
    if (keyPressed == true)
    {
      if (keyCode == RIGHT)
      {
        direction = 1;    //sets spritie direction to right
        player_x +=8;    //If x pos. increases sprite moves right
        frame++;    //Moves a step every frame
        if(frame>16) frame =0;    //if frame = 16 then reset it back to 0
      }
      if (keyCode == LEFT)
      {
        direction = 0;    //setting spirite direction to left
        player_x -=8;    //if x pos. decreases sprite moves to the left
        frame++;
        if(frame>16) frame =0;
      }
    }
    
     if ((drop_y>368)&&(drop_y<470)) // If drop is on same level as player
   {
     if(abs((drop_x+10)-(player_x+62))<25) // And drop is near player
     {
     drop_count++; // Increase drop count by one (caught)

     drop_x=166+(int)random(200); // Restart a new drop in the cloud
     drop_y=90;
     }
   } 

    
    if ((leaf_y> 368)&&(leaf_y < 470))    //if the leaf is on the same level as the player..
    {
      if(abs((leaf_x + 10) - (player_x + 62))<25)    //and the leaf is near player
      {
        leaf_count++;    //if caught increase leaf count
        
        float radius = random(128);    //leafy star pos.
        float angle = random(2*PI);
        leaf_x = 584+(int)(radius*cos(angle));
        leaf_y = 216+(int)(radius*sin(angle));
      }
    }
    
    //displays score info on top of the screen
    textSize(18);
    fill(0, 0, 255);
    text("Drop: "+drop_count, 540, 20);
    
    fill(0, 255, 0);
    text("Leaf: "+leaf_count, 620, 20);
    
    fill(255, 0, 0);
    text("Lives: "+lives, 700, 20);
    
    fill(0, 0, 0);
    text("Score: "+score, 620, 60);
    
    //game logic and scoring ifno
    
    if (lives<1) text ("Game Over", 120, 300);    //score of 0 = game over
    score++;
    
    if(leaf_count>2)     //every 2 leaves, life point should go up by one
    {
      leaf_count-=2;
      lives++;
    }
    if(drop_count>2)     // every 2 drops life goes up by one
    {
      drop_count-=2;
      lives++;
    }
    if(quit_flag==1)    //have to wait 2 - 5 seconds was too long for editing
    {
      delay(2000);
      exit();
    }
    if(lives<1)    //if all lives are gone = game over, but - allowed to draw one more time to have Game OVer displayed
    {
      quit_flag = 1;
    }
  }
