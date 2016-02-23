int numBalls = 30;
float spring = 0.01;
float gravity = 0.03;
float friction = -0.9;
//Ball[] balls = new Ball[numBalls];
ArrayList<Ball> balls = new ArrayList();

void setup() {
  size(640, 360);
  for (int i = 0; i < numBalls; i++) {
    balls.add(new Ball(random(width), random(height), random(-1,1), random(-1,1), random(10, 10), i, 255,  balls));
  }
  noStroke();
  fill(255, 204);
}

void draw() {
  background(0);
  for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.display();
  }
  removeBalls();
}

void removeBalls() {
  ArrayList toRemove = new ArrayList();
  for (Ball ball : balls) {
      if (ball.diameter < 1) {
          toRemove.add(ball);
      }
  }
  balls.removeAll(toRemove);
}