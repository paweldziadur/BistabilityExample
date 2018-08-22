PShape obj; 
boolean firstStage = true;
float rotYconst1 = 1.3;
float rotYconst2 = 14.7;
float rotY = 1.3;

void setup()
{
  size(1920, 1080, P3D);
  obj = loadShape("object.obj");
}

void draw()
{
  background(176);
  drawText();
  drawObject();
}

void drawText()
{
  textSize(32);
  fill(163, 99, 31, 204);
  if (firstStage)
  {
    text("Perception Bistability Example. Hey user, what do you see now in this image, hmmm?? Press any key.", 12, 45, -30);  
  } else
  {
    text("Perception Bistability Example. Oh it's rotating! How about now ? Any changes ? Press any key.", 12, 45, -30); 
  }
}

void drawObject()
{
  pushMatrix();
  pushStyle();
  lights();
  translate(943, 177, 815);
  rotateY(14.7);
  if (firstStage)
  {
    rotateY(1.3);
  }
  else
  {
    rotY = rotY - 0.02;
    rotateY(rotY);
    
  }
  
  translate(0, 377, 7);
  scale(44.f);
  shape(obj);
  popMatrix();
  popStyle();
}

void keyPressed() {
  if (firstStage == false) {
    firstStage = true;
  } else {
    firstStage = false;
    rotY = rotYconst1;
  }
}