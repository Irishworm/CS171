Submit a simple drum machine code with all todo’s complete,

Open the getMetaData sketch from the Minim basic examples subfolder. Run the sketch on groove.mp3 and note each line of the metadata text.

Open the skip.pde sketch from the Minim examples in the subfolder AuidoPlayer. The keyPressed() function allows you to rewind or fast forward the song based on whether you press the ‘r’ key or the ‘f’ key. Add this functionality to the first sketch so that pressing ‘p’ will pause the song, ‘f’ will skip forward a number of milliseconds(+1000) and ‘r’ will skip backwards(-1000) the same amount. Add a text line on the screen giving instructions on the key to control skipping. Use the spacebar to take a snapshot of the wave playing.

Combine the code for setting the number of loops based on a number key pressed with this sketch.

Add a void keyPressed() method to the end of the sketch. In the keyPressed() method add code to change the wave shape to one of Waves.SINE, Waves.SQUARE, Waves.TRIANGLE, Waves.SQUARE, Waves,QUARTERPULSE) when the keys 1,2,3,4,are pressed respectively.

We can change the modulation amount(the amount the pitch changes) and the modulation Frequency (the speed it changes) in the map functions in mouseMoved. Change both map functions as follows and then run the sketch again, moving the mouse across the screen to hear the difference.

Rather than using particular keys to control the sound, code a mousePressed() function which will play each drum when clicked with the mouse. To do this note where each ellipse is on the screen. If mouseX is over the left part of the screen it should play drum1 otherwise it should play drum2.

Now add two more ellipses below the first two which will trigger two more drum sounds when clicked with the mouse. Add the samples, kick and snare, to the sketch from Moodle. You will need to code the mousePressed() function so that when you are over any of the 4 ellipses a mouse click will trigger that drum sound. 

First, we are going to move the Rect class to a new tab. Click on the white upside-down triangle beside the DrumMachine tab and choose New Tab. Give it the name Rect.

Change the bpm at the top of the sketch to change the speed of the sequence. Add one or more rows of 16 rectangles to the DrumMachine matrix to trigger another sample from the samples on Moodle.

------
6.00/6.00
