
abstract class Entity {
  
  PVector position;
  PVector velocity;
  float speed;
  int radius;
  color entityColor;
  
  public Entity(PVector position, int radius, float speed, color col) {
    this.position = position;
    this.velocity = new PVector(0, 0);
    this.radius = radius;
    this.speed = speed;
    this.entityColor = col;
  }
  
  public void display() {
    stroke(0);
    strokeWeight(1);
    fill(entityColor);
    circle(position.x, position.y, radius * 2);
  }
  
  void move() {
    velocity.setMag(this.speed);
    position.add(velocity);
  }
}
