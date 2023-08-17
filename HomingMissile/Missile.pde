
class Missile extends Entity {
  
  Player target;
  
  Missile(int xPos, int yPos, Player target, float speed) {
    super(new PVector(xPos, yPos), 10, speed, color(#00FF00));
    this.target = target;
    println(position);
  }
  
  PVector getDifferenceVector() {
    float dx = target.position.x - this.position.x;
    float dy = target.position.y - this.position.y;
    return new PVector(dx, dy);
  }
  
  void purePursuit() {
    velocity = getDifferenceVector().setMag(speed);
  }
  
  void move() {
    super.move();
    velocity.set(0, 0);
    
    if(this.position.dist(target.position) < this.radius + target.radius) {
      detonate();
    }
  }
  
  void predictiveTargetting() {
    PVector diff = getDifferenceVector();
    
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
}
