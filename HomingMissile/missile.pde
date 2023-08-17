
class Missile {
  
  PVector position;
  PVector velocity;
  
  Player target;
  float speed = 1.1;
  int radius = 10;
  
  Missile(int xPos, int yPos, Player target) {
    this.position = new PVector(xPos, yPos);
    this.velocity = new PVector(3, 3);
    this.target = target;
  }
  
  void purePursuit() {
    float dx = target.position.x - this.position.x;
    float dy = target.position.y - this.position.y;
    velocity = new PVector(dx, dy).setMag(speed);
  }
  
  void move() {
    velocity.setMag(this.speed);
    position.add(velocity);
    velocity.set(0, 0);
    
    if(this.position.dist(target.position) < this.radius + target.radius) {
      detonate();
    }
  }
  
  void predictiveTargetting() {
    
    float dx = target.position.x - this.position.x;
    float dy = target.position.y - this.position.y;
    PVector diff = new PVector(dx, dy);
    
    // Calculate the signed target angle (angle HUNTER-PREY-PREY_DIR), is between -180 (right) to 180 (left)
    float targetAngle = PI - atan2(diff.y * target.velocity.x - diff.x * target.velocity.y, diff.x * target.velocity.x + diff.y * target.velocity.y);
    
    // Calculate the lead angle (relative to the diff vector)
    float leadAngle = asin((sin(targetAngle) * target.speed) / this.speed);
    
    // Rotate the diff vector by the lead angle (negative cuz math idk)
    PVector leadVector = diff.rotate(-leadAngle).setMag(1);
    
    velocity = leadVector.setMag(speed);
    
    stroke(3);
    line(position.x, position.y, position.x + leadVector.x * 20, position.y + leadVector.y * 20);
  }
  
  void detonate() {
    noStroke();
    fill(color(#FCAE03));
    circle(position.x, position.y, 80);
    this.position = new PVector(width/2, height/8*7);
  }
  
  void display() {
    stroke(255, 0, 0);
    strokeWeight(5);
    line(position.x, position.y, position.x + velocity.x * 5, position.y + velocity.y * 5);
    
    stroke(0);
    strokeWeight(1);
    fill(0, 255, 0);
    circle(position.x, position.y, radius*2);
  }
}
