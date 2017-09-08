int score = 0;
int size = 50;
int X = 0; 
int Y = 400;
boolean imalive= true;
boolean setscore = false;
int hail = 30;
int Speed = 1;
float[] Sps = new float[hail];
float[] Xs = new float[hail];
float[] Ys = new float[hail];
PImage myimgsp;
PImage myimgsp2;

void setup()
{
  size(800, 800);
  myimgsp = loadImage("Car.png");
  myimgsp2 = loadImage("game_over.png");
  imageMode(CENTER);

  for (int i=0; i< hail; i++)
  {
    Xs[i] = random(width);
    Ys[i] = random(width);
    Sps[i] = 1;
  }
}

void draw()
{
  fill(255, 55, 0);
  background(0);
  image(myimgsp, X, Y, size, 25);

  for (int i = 0; i< hail; i++)
  {

    rect(Xs[i], Ys[i], 5, 5);
    Ys[i] = Ys[i] + Sps[i];
    if (Ys[i] > height)
    {
      Ys[i] = 0;
      Xs[i] = random(width);
    }
    if (dist(Xs[i], Ys[i], X, Y) < (25 + 2.5))
    {
      imalive = false;
      setscore = true;
    }
    if (imalive == false)
    {
      textSize(100);
      text("game_over", 100, 100);
      size = 0;
      Sps[i] = 0;
      
    }
    if (setscore == false )
    {
      textSize(10);
      text(millis(), 700, 700);
      println(millis());
    }
    if(X < 0)
    {
      X = width;
    }else if (X > width)
  {
    X = 0;
  }else if( Y < 0)
  {
    Y = height;
  }else if( Y > height)
  {
    Y = 0;
  }
  }
}
void keyPressed()
{
  if (key == 'w')
  {
    Y = Y -10;
  } else if (key == 'a')
  {
    X = X -10;
  } else if (key == 's')
  {
    Y = Y +10;
  } else if (key == 'd')
  {
    X = X + 10;
  }
}