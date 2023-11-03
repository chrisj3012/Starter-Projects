
float spring = 0.05;
float gravity = 0.09;
float friction = -1;
ArrayList<Ball> balls = new ArrayList();

void setup() {
  size(640, 360);
  noStroke();
  fill(255, 204);
}

void draw() {
  background(0);
  
  for (int i = 0; i < balls.size(); i++) {
       Ball b = balls.get(i);
       for(int ii = i; ii < balls.size(); ii ++){
          float dx = balls.get(ii).x - b.x;
          float dy = balls.get(ii).y - b.y;
          float distance = sqrt(dx*dx + dy*dy);
          float minDist = balls.get(ii).diameter/2 + b.diameter/2;
           if (distance < minDist) { 
            float angle = atan2(dy, dx);
            float targetX = b.x + cos(angle) * minDist;
            float targetY = b.y + sin(angle) * minDist;
            float ax = (targetX - balls.get(ii).x) * spring;
            float ay = (targetY - balls.get(ii).y) * spring;
            b.vx -= ax;
            b.vy -= ay;
            balls.get(ii).vx += ax;
            balls.get(ii).vy += ay;
         }
      }
   } 
    
   for(int i = 0; i < balls.size(); i++){
     balls.get(i).move();
     balls.get(i).display();
   }
}

 void mouseReleased(){
      balls.add(new Ball(mouseX, mouseY, random(30, 70)));
 }
