import ddf.minim.*;

Minim minim;
AudioPlayer player;

int loopBegin;
int loopEnd;

void setup()
{
  size(512, 200, P3D);
  
 // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
 // loadFile will look in all the same places as loadImage does.

  player = minim.loadFile("groove.mp3");

}

void draw()
{
  background(0);
  stroke(255);
  
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
    line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
  }
  


  // draw a line to show where in the song playback is currently located
  float posx = map(player.position(), 0, player.length(), 0, width);
  stroke(0,200,0);
  line(posx, 0, posx, height);
  
  if ( player.isPlaying() )
  {
    text("Press 'p' to pause playback.", 10, 20 );
  }
  else
  {
    text("Press any key to start playback.", 10, 20 );
  }
  
   stroke(255);
   text("Press 'f' to skip forward and 'r' to skip backward.", 10, 40);
}


void mousePressed()
{
  int ms = (int)map(mouseX, 0, width, 0, player.length());
  if ( mouseButton == RIGHT )
  {
    player.setLoopPoints(loopBegin, ms);
    loopEnd = ms;
  }
  else
  {
    player.setLoopPoints(ms, loopEnd);
    loopBegin = ms;
  }
}

void keyPressed()
{
  
  if ( key == 'f' )
  {
    // skip forward 1 second (1000 milliseconds)
    player.skip(1000);
  }
  if ( key == 'r' )
  {
    // skip backward 1 second (1000 milliseconds)
    player.skip(-1000);
  }
  
  if ( player.isPlaying() )
  {
    if( key == 'p')
    player.pause();
  }
  
  String keystr = String.valueOf(key);
  int num = int(keystr);
  if(num > 0 && num < 10)
  {
   num--;
   player.loop(num);
  }
 //if num is between 0 and 10
 // loop the player

  
  // if the player is at the end of the file,
  // we have to rewind it before telling it to play again
  //else if ( player.position() == player.length() )
  //{
   // player.rewind();
    //player.play();
  //}
  else
  {
    player.play();
  }
}

void keyReleased() 
{
  if (key == ' ') 
     save("sketch1a2.png");
}
