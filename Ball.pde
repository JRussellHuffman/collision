class Ball {
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  int fill;
  ArrayList<Ball> others;
 
  Ball(float xin, float yin, float vxin, float vyin, float din, int idin, int fillIn, ArrayList<Ball> ballsIn) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    fill = fillIn;
    others = ballsIn;
    vx = vxin;
    vy = vyin;
  } 
  
  void collide() {
    for (int i = id+1; i < others.size(); i++) {
      float dx = others.get(i).x - x;
      float dy = others.get(i).y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others.get(i).diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others.get(i).x) * spring;
        float ay = (targetY - others.get(i).y) * spring;
        vx -= ax;
        vy -= ay;
        others.get(i).vx += ax;
        others.get(i).vy += ay;
        if (diameter >= others.get(i).diameter) {
          others.get(i).diameter -=1;
          diameter +=1;
        } else {
          diameter -=1;
          others.get(i).diameter +=1;
        }
      }
    }   
  }
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
    fill(fill, 200);
    ellipse(x, y, diameter, diameter);
  }
}