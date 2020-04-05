void setup() {
  size(400, 800);
  frameRate(2);
  
}

void draw() {
  
  String hs = "ffffff";
  int hi = unhex(hs);
  background(hi);
  
  int numberOfChords = 20;
  
  strokeWeight(3);

  // circle 1 
  int cx1 = 200;
  int cy1 = 190;
  int d1 = 340;
  
  // circle 2
  int cx2 = 200;
  int cy2 = 505;
  int d2 = 210;
  
  // circle 3
  int cx3 = 200;
  int cy3 = 715;
  int d3 = 130;
  
  //circle(cx1, cy1, d1);
  randomSeed(42);
  for (int i = 1; i < numberOfChords; i++){
    double alpha = random(0,6.8);
    double beta = alpha + random(1,5);
    drawChords(alpha, beta,d1/2,cx1,cy1);
  }
  
  
  for (int i = 1; i < numberOfChords; i++){
    double alpha = random(0,6.8);
    double beta = alpha + random(1,5);
    drawChords(alpha, beta,d2/2,cx2,cy2);
  }
  
  for (int i = 1; i < numberOfChords; i++){
    double alpha = random(0,6.8);
    double beta = alpha + random(1,5);
    drawChords(alpha, beta,d3/2,cx3,cy3);
  }
  
  saveFrame("render/out.png");
}

void drawChords(double alpha, double beta, double radius, int x0, int y0){
  double x1 = radius * Math.cos(alpha);
  double y1 =  radius * Math.sin(alpha);
  double x2 = radius * Math.cos(beta);
  double y2 = radius * Math.sin(beta);
  float x1f = (float)x1 + x0;
  float y1f = (float)y1 + y0;
  float x2f = (float)x2 + x0;
  float y2f = (float)y2 + y0;
  
  line(x1f, y1f, x2f, y2f);
}

public static double computeChrodLength(int radius, int theta){
  // cl = 2r sin(theta/2)
  double cL = 2*radius*Math.sin(theta/2);
  return cL;
}
