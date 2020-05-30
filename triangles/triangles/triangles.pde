void setup() {
  size(400, 800);
  frameRate(2);
  
}

void draw() {
  // setting background
  String hs = "ffffff";
  int hi = unhex(hs);
  background(hi);
  
  // params
  int numberOfElements = 3;
  int numberOfTriangles = 4;
   strokeWeight(3);
   randomSeed(42);
   
  // element 1 
  int d1 = 210;
  int cx1 = 200;
  int cy1 = 300 - d1/2;
  
  // ellipse(cx1, cy1, d1, d1);
  drawElement(cx1,cy1,d1,25,-20,numberOfTriangles);
  
  // element 2
  int d2 = 130;
  int cx2 = 200;
  int cy2 = 505 - d2/2;

  drawElement(cx2,cy2,d2,-20,-15,numberOfTriangles);
  
  // element 3
  int d3 = 80;
  int cx3 = 200;
  int cy3 = 715 - d3/2;

  drawElement(cx3,cy3,d3,15,-10,numberOfTriangles);
   
   
    saveFrame("render/out.png");
   
  
  
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
