// // this is related with the namespace but i still not fully get it...
// new p5();

let planet;
let planet2;

function setup() {
    createCanvas(400, 400);
    background(220);
    frameRate(20);

    var N = 100;
    var x = createRandomPoints(N, 400);
    var y = createRandomPoints(N, 400);
    var r = createRandomPoints(N, 30);

    // var x = [10, 20, 230];
    // var y = [100, 200, 300];
    // var r = [10, 2, 20];

    // planet = new Planet(100, 200, 20);
    // print(planet.x, planet.y);
    // planet2 = new Planet(200, 200, 20);

    arrPlanets = createArrayPlanets(x, y, r);
}

function createRandomPoints(numberofpoints, max) {
    var y = new Array();
    var i;
    for (i = 0; i < numberofpoints; i++) {
        y[i] = random(max);
    }
    return y;
}


// maybe this should be a class?
function createArrayPlanets(x, y, r) {
    var planets = new Array();
    var totalElements = x.length;
    var i;
    for (i = 0; i < totalElements; i++) {
        planets[i] = new Planet(x[i], y[i], r[i]);
    }
    return planets;
}

function draw() {
    //this comes from set up which has been already created once
    background(0);
    for (var i = 0; i < arrPlanets.length; i++) {
        arrPlanets[i].move();
        arrPlanets[i].show();
    }

}


class Planet {
    constructor(x, y, r) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.text = "w";
    }
    move() {
        this.x = this.x + random(-5, 5);
        this.y = this.y + random(-5, 5)
    }
    show() {

        stroke(255);
        strokeWeight(4);
        noFill();
        ellipse(this.x, this.y, this.r * 2, this.r * 2) // this is the diameter
    }
}