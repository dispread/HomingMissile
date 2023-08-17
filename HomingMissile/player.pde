
class Player {
  
  PVector position;
  PVector velocity;
  float speed = 1;
  int radius = 15;
  
  boolean alive = true;
  
  Player(int xPos, int yPos) {
    this.position = new PVector(xPos, yPos);
    this.velocity = new PVector(0, 0);
  }
  
  void updateVelocity(PVector direction) {
    this.velocity.add(direction);
  }
  
  void move() {
    velocity.setMag(this.speed);
    position.add(velocity);
  }
  
  void display() {
    fill(color(50, 50, 255));
    circle(position.x, position.y, radius*2);
    velocity.set(0, 0);
  }
}
