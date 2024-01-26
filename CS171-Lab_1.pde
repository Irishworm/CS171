void setup()
{
  size(1920, 1080);
}
void draw()
{
  background(25, 95, 160);
  fill(155, 120, 160);


 //Non-moving Bubbles
  
  fill(135, 175, 205);
  ellipse(200,650,60,60);
  
  fill(135, 175, 205);
  ellipse(500,400,60,60);
  
  fill(135, 175, 205);
  ellipse(800,600,60,60);
  
  fill(135, 175, 205);
  ellipse(1000,300,60,60);
  
  fill(135, 175, 205);
  ellipse(1200,500,60,60);
  
  fill(135, 175, 205);
  ellipse(1450,200,60,60);
  
   fill(135, 175, 205);
  ellipse(1590,750,60,60);
  
  
  //Behind Seaweed
  
  fill(20, 128, 24);
  rect(10, 800, 20, 120);
  
  fill(20, 128, 24);
  rect(225, 800, 25, 120);
  
  fill(20, 128, 24);
  rect(420, 750, 15, 170);
  
  fill(20, 128, 24);
  rect(900, 800, 25, 120);
  
  fill(20, 128, 24);
  rect(1200, 650, 40, 250);
  
  fill(20, 128, 24);
  rect(1450, 740, 30, 190);
  
  fill(20, 128, 24);
  rect(1650, 810, 20, 110);
  
  
  //moving bubble but behind sand
  
  fill(240, 260, 255);
  ellipse(1100, -frameCount%420+1000, 45, 45);
  
  
 //Sand
  
  fill(240, 225, 180);
  rect(0,900,1920,200);
  
  
 //Fish
  
  fill(245, 220, 210);
  triangle(mouseX-60, mouseY-40, mouseX+0, mouseY+0, mouseX-60, mouseY+45);
  
  fill(235, 200, 190);
  rect(mouseX-144, mouseY-40, 84, 84);
  
  fill(170, 85, 75);
  quad(mouseX-60, mouseY-40, mouseX-120, mouseY-40, mouseX-150, mouseY-75, mouseX-90, mouseY-75);
  
  fill(170, 85, 75);
  quad(mouseX-90, mouseY+80, mouseX-145, mouseY+80, mouseX-115, mouseY+45, mouseX-60, mouseY+45);
  
  fill(0,0,0);
  ellipse(mouseX-40, mouseY-5, 15, 25);
  
  fill(50, 35, 40);
  quad(mouseX-175, mouseY+35, mouseX-205, mouseY+5, mouseX-175, mouseY-25, mouseX-145, mouseY+5);
  
  
  //Moving Bubbles
  
  fill(240, 260, 255);
  ellipse(80, -frameCount%630+600, 45, 45);
  
  fill(240, 260, 255);
  ellipse(390, -frameCount%370+300, 45, 45);
  
  fill(240, 260, 255);
  ellipse(680, -frameCount%200+690, 45, 45);
  
  fill(240, 260, 255);
  ellipse(1400, -frameCount%220+890, 45, 45);
  
  fill(240, 260, 255);
  ellipse(1750, -frameCount%920+730, 45, 45);


  //Infront Seaweed
  
  fill(20, 128, 24);
  rect(110, 780, 10, 120);
  
  fill(20, 128, 24);
  rect(300, 710, 30, 190);
  
  fill(20, 128, 24);
  rect(700, 820, 35, 80);
  
  fill(20, 128, 24);
  rect(1000, 780, 25, 120);
  
  fill(20, 128, 24);
  rect(1360, 830, 28, 70);
  
  fill(20, 128, 24);
  rect(1775, 700, 35, 200);
  
  
}
