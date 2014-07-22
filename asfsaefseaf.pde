PImage photo;

class point
{
  public int x, y;
  point(int x0, int y0)
  {
    x=x0;
    y=y0;
  }
  point()
  {
    x=0;
    y=0;
  }
  void draw()
  {
    noStroke();
    fill(#ff0000);
    ellipse(x, y, 5, 5);
  }
}

point[] locations = {
  new point(159, 245), 
  new point(267, 223), 
  new point(278, 281), 
  new point(279, 291), 
  new point(267, 221), 
  new point(297, 253), 
  new point(305, 233), 
  new point(310, 229), 
  new point(314, 224), 
  new point(541, 192), 
  new point(899, 268), 
  new point(890, 294), 
  new point(850, 338)
};

void setup() {
  size(1100, 714);
  photo = loadImage("pic.jpg");
}
void draw() {
  image(photo, 0, 0);
  for(int i = 0; i != 13; i++)
  {
    locations[i].draw();
  }
//  text(mouseX,10,10);
//  text(mouseY,50,10);
}

