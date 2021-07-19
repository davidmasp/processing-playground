var canvasTotal = 500;
var correction = canvasTotal / 1.5;
var elementsGrid = 50;
var elementsWidth;
var removeRate;
var offsetX = 20;
var offsetY = 30;
var textSizeVal = 32;

elementsWidth = (canvasTotal - offsetX * 2) / elementsGrid;
elementsHeight = (canvasTotal - offsetY * 2) / elementsGrid;

var exclusionZoneX1 = 0;
var exclusionZoneX2 = 225;
var exclusionZoneY1 = 0;
var exclusionZoneY2 = 225;

var centralDensityX;
var centralDensityY;
centralDensityX = 190;
centralDensityY = 190;

function preload() {
  fontMont = loadFont('assets/Montserrat-Black.ttf');
  fontRob = loadFont('assets/RobotoCondensed-Regular.ttf');
}

function setup() {
  createCanvas(canvasTotal, canvasTotal);
  //initial
  removeRate = 0.07;
}

function draw() {
  // centralDensityX = mouseX;
  // centralDensityY = mouseY;
  background(0);
  frameRate(20);
  
  fill(255);
  textFont(fontMont);
  textSize(textSizeVal);
  text('Radiant', offsetX+2, offsetY+textSizeVal);

  textFont(fontRob);
  textSize(textSizeVal-3);
  text('David Mas | @davidmasp', offsetX+2, offsetY+textSizeVal+textSizeVal+textSizeVal);

  stroke(255);

  for (let i = 0; i < elementsGrid; i++) {
    // vertical line
    let posX1;
    let posX2;
    let posY1;
    let posY2;

    posX1 = offsetX + i * elementsWidth;
    posX2 = posX1 + elementsWidth;
    for (let j = 0; j < elementsGrid; j++) {
      posY1 = offsetY + j * elementsHeight;
      posY2 = posY1;

      var distance = dist(posX1, posY1, centralDensityX, centralDensityY);
      console.log(distance);
      tmpRemoveRate = distance / correction + removeRate;
      randomEvent = random(0, 1) > tmpRemoveRate;
      eZoneX = posX2 < exclusionZoneX1 || posX1 > exclusionZoneX2;
      eZoneY = posY2 < exclusionZoneY1 || posY1 > exclusionZoneY2;

      if (randomEvent && (eZoneX || eZoneY)) {
        line(posX1, posY1, posX2, posY2);
      }
    }

    posX2 = posX1;
    for (let j = 0; j < elementsGrid; j++) {
      posY1 = offsetY + j * elementsHeight;
      posY2 = posY1 + elementsHeight;
      var distance = dist(posX1, posY1, centralDensityX, centralDensityY);
      console.log(distance);
      tmpRemoveRate = distance / correction + removeRate;
      randomEvent = random(0, 1) > tmpRemoveRate;
      eZoneX = posX2 < exclusionZoneX1 || posX1 > exclusionZoneX2;
      eZoneY = posY2 < exclusionZoneY1 || posY1 > exclusionZoneY2;
      if (randomEvent && (eZoneX || eZoneY)) {
        line(posX1, posY1, posX2, posY2);
      }
    }
  }
  //save("mySVG.png"); // give file name
  print("saved svg");
  noLoop();
}
