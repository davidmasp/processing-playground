

void setup() {
  size(1500, 1000);
  frameRate(60);
  
}


void draw() {

String hs = "dbd7cc";
int hi = unhex(hs);
background(hi);

int ratio = 50;
int baseSize = 15;

// text("stop dancing", mouseX + 20, mouseY - 20);


Integer valSum = Integer.max(mouseX, mouseY);
double valF = valSum / ratio;

int value;
if (valF < 2){
  value = 0;
} else {
  value = Math.toIntExact(Math.round(valF));
}

int value2 = reverseFib(value);
//println(value2);

int[] fibNumbers = fibonacciSeq(value2);

int stepx = 1;
int stepy = 0;

int pointX = ratio;
int pointY = ratio;

for (int i = 0; i < fibNumbers.length; i++){
  // first I have to set up the initial point
  if (stepx == 0) {
    stepx = 1;
    stepy = 0;
  } else {
    stepx = 0;
    stepy = 1;
  }
  
  // now change the pX and pY according to this
  pointX = pointX + fibNumbers[i]*stepx*ratio;
  pointY = pointY + fibNumbers[i]*stepy*ratio;
  
  String selectedColor = "a6cee3";
  println(selectedColor);
  drawSquare(pointX,pointY,fibNumbers[i],ratio,baseSize);
  
};

fill(255);
}


void drawSquare(int pix,int piy,int mult, int baseN, int baseTextSize) {
  
  fill(178, 223, 138);
  rect(pix-baseN*mult,piy-baseN*mult,mult*baseN,mult*baseN);
  ellipse(pix-(baseN*mult)/2,piy-(baseN*mult)/2,mult*baseN,mult*baseN);
  fill(0);
  textSize(baseTextSize + mult);
  text(mult,pix - (baseN*mult)/2, piy - (baseN*mult)/2);
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

public static int reverseFib(int value){
  int res = 1;
  int it = 2;
  while(res <= value){
    it++;
    int[] res_arr = fibonacciSeq(it);
    res = res_arr[res_arr.length-1];
  }
  return it;
}
