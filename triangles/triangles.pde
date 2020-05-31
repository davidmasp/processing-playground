double a, b, a2, b2, a3, b3;
float aIncrement, bIncrement, aI2, bI2, aI3, bI3;

void setup() {
  size(400, 800);
  frameRate(100);
  randomSeed(10);
  // the 0 here is down..
  a = a2 = a3 = 3.925;
  b = b2 = b3 = 3.925;
  aIncrement = aI2 = aI3 = 0.1;
  bIncrement = bI2 = bI3 = 0.1;
  
}

void draw() {
  // setting background
  String hs = "ffffff";
  int hi = unhex(hs);
  background(hi);
  
  // first triangle
  // recording the previous frame
  b = a;
  // 1% chance of changing directions
  // this is  vs [990,999]
  if (random(1000) >= 985){
    aIncrement = -aIncrement;
  }
  bIncrement = aIncrement;
  a = a + aIncrement;
  
  // second triangle
  b2 = a2;
  if (random(1000) >= 985){
    aI2 = -aI2;
  }
  bI2 = aI2;
  a2 = a2 + aI2;
  
  // third triangle
  b3 = a3;
  if (random(1000) >= 985){
    aI3 = -aI3;
  }
  bI3 = aI3;
  a3 = a3 + aI3;
  
  // params
  int numberOfTriangles = 4;
  strokeWeight(3);

  // element 1 
  int d1 = 210;
  int cx1 = 200;
  int cy1 = 300 - d1/2;
  
  double mx1 = 25 * Math.sin(a);
  double my1 = 25 * Math.cos(a);
  float mx1F = (float) mx1;
  float my1F = (float) my1;
  
  drawElement(cx1,cy1,d1,mx1F,my1F,numberOfTriangles);
  
  // element 2
  int d2 = 130;
  int cx2 = 200;
  int cy2 = 505 - d2/2;
  
  mx1 = 20 * Math.sin(a2);
  my1 = 20 * Math.cos(a2);
  mx1F = (float) mx1;
  my1F = (float) my1;

  drawElement(cx2,cy2,d2,mx1F,my1F,numberOfTriangles);
  
  // element 3
  int d3 = 80;
  int cx3 = 200;
  int cy3 = 715 - d3/2;
  
  mx1 = 15 * Math.sin(a3);
  my1 = 15 * Math.cos(a3);
  mx1F = (float) mx1;
  my1F = (float) my1;

  drawElement(cx3,cy3,d3,mx1F,my1F,numberOfTriangles);
   

  saveFrame("render/out_####.png");
}


void drawTriangleFromCenter(float xc, float yc, float sideWidth){
  float h = (sqrt(3)/2) * sideWidth;
  
  float x1 = xc - sideWidth/2;
  float y1 = yc + h/2;
  
  float x2 = xc + sideWidth/2;
  float y2 = yc + h/2;
  
  float x3 = xc;
  float y3 = yc - h/2;
  
    
  triangle(x1, y1, x2, y2, x3, y3);
  
}

void drawElement(float xc, float yc, float diameter,float movex, float movey, int it){
  // diameter is the diameter of the circumcircle
  // https://www.mathopenref.com/trianglecircumcircle.html
  
  float sideWidth = (diameter / 2) * sqrt(3);
    
  for (int i = 1; i <= it; i++){
    drawTriangleFromCenter(xc,yc,sideWidth);
    
    xc = xc + movex;
    yc = yc + movey;
  }
  
}


public static int[] fibonacciSeq(int iterations){
  
    int[] numbers = new int[iterations];
    
    numbers[0] = 1;
    numbers[1] = 1;
    
    for (int it = 2; it < numbers.length ; it++ ){
      numbers[it] = numbers[it-1] + numbers[it-2];
    }
    
    return numbers;
}
