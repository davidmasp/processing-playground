void setup() {
  size(400, 800);
  frameRate(150);
   
}


int numberOfChords = 20;


double[] signs = getS(numberOfChords);


double[] alphas1 = getAlphas(numberOfChords);
double[] betas1 = getBetas(alphas1);

double[] alphas2 = getAlphas(numberOfChords);
double[] betas2 = getBetas(alphas2);

double[] alphas3 = getAlphas(numberOfChords);
double[] betas3 = getBetas(alphas3);

void draw() {
  
  String hs = "ffffff";
  int hi = unhex(hs);
  background(hi);
  
  strokeWeight(3);
  
  double[] RV = generate_RV(numberOfChords);
  
  // circle 1 
  alphas1 = updateAB(alphas1, signs,RV);
  betas1 = updateAB(betas1, signs,RV);
  int cx1 = 200;
  int cy1 = 190;
  int d1 = 340;
  
  // circle 2
  alphas2 = updateAB(alphas2, signs,RV);
  betas2 = updateAB(betas2, signs,RV);
  int cx2 = 200;
  int cy2 = 505;
  int d2 = 210;
  
  // circle 3
  alphas3 = updateAB(alphas3, signs,RV);
  betas3 = updateAB(betas3, signs,RV);
  int cx3 = 200;
  int cy3 = 715;
  int d3 = 130;
  
  //circle(cx1, cy1, d1);
  //randomSeed(42);
  
  
  
  drawFullCircle(alphas1,betas1, cx1, cy1, d1);
  drawFullCircle(alphas2,betas2, cx2, cy2, d2);
  drawFullCircle(alphas3,betas3, cx3, cy3, d3);
  

  
  saveFrame("render/out_####.png");
}

double[] getS(int numberOfChords){
  double[] signs = new double[numberOfChords];

  for (int i = 0; i < numberOfChords; i++) {
    float tmp = random(-1,1);
    if(tmp>0){
      signs[i] = 1;
    } else {
      signs[i] = -1;
    }
  }
  
  return signs;
}


void drawFullCircle(double[] alphas, double[] betas, int cx, int cy, int d){
  FloatList[] lines_arr = getCircleCoords(alphas,betas,cx,cy,d);
  drawCircle(lines_arr);
}

void drawRandomCircle(int numberOfChords, int cx, int cy, int d){
  double[] alphas = getAlphas(numberOfChords);
  double[] betas = getBetas(alphas);
  FloatList[] lines_arr = getCircleCoords(alphas,betas,cx,cy,d);
  drawCircle(lines_arr);
}

double[] generate_RV(int nElem){
  double[] rand_out = new double[nElem];
  for (int i = 0; i<nElem; i++){
      rand_out[i] = random(0,0.02);
  }
  return rand_out;
}

double[] updateAB(double[] AB, double[] signs, double[] random_value){
  int numElem = AB.length;
  double[] newAB = new double[numElem];
  for (int i = 0; i< numElem; i++){
    newAB[i] = AB[i] + random_value[i] * signs[i];
  }
  return newAB;
}

double[] getAlphas(int numberOfChords){
  double[] alpha_out = new double[numberOfChords];
  for (int i = 0; i < numberOfChords; i++){
    alpha_out[i] = random(0,6.8);
  }
  return alpha_out;
}

double[] getBetas(double[] alphaArr){
  int numberOfChords = alphaArr.length;
  double[] beta_out = new double[numberOfChords];
  for (int i = 0; i < numberOfChords; i++){
    beta_out[i] = alphaArr[i] + random(1,5);
  }
  return beta_out;
}

FloatList[] getCircleCoords(double[] alphaArr, double[] betaArr, int cx, int cy, int d){
  int numberOfChords = alphaArr.length;
  FloatList[] array_out = new FloatList[numberOfChords];
  for (int i = 0; i < numberOfChords; i++){
    double alpha = alphaArr[i];
    double beta = betaArr[i];
    FloatList line_values = getChoordCors(alpha, beta,d/2,cx,cy);
    array_out[i] = line_values;
  }
  return array_out;
}

void drawCircle(FloatList[] chordsArray){
  int n_ch = chordsArray.length;
  for (int i = 0; i < n_ch; i++){
    FloatList line_values = chordsArray[i];
    drawChords(line_values);
  }
}

//void updateCircle(int )
FloatList getChoordCors(double alpha, double beta, double radius, int x0, int y0){
  double x1 = radius * Math.cos(alpha);
  double y1 =  radius * Math.sin(alpha);
  double x2 = radius * Math.cos(beta);
  double y2 = radius * Math.sin(beta);
  float x1f = (float)x1 + x0;
  float y1f = (float)y1 + y0;
  float x2f = (float)x2 + x0;
  float y2f = (float)y2 + y0;
  
  FloatList ch_coord = new FloatList();
  ch_coord.append(x1f);
  ch_coord.append(y1f);
  ch_coord.append(x2f);
  ch_coord.append(y2f);

  return ch_coord;
}

void drawChords(FloatList coords){
  line(coords.get(0), coords.get(1), coords.get(2), coords.get(3));
}

public static double computeChrodLength(int radius, int theta){
  // cl = 2r sin(theta/2)
  double cL = 2*radius*Math.sin(theta/2);
  return cL;
}
