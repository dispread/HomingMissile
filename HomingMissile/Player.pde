
class Player extends Entity {
  
  Player(int xPos, int yPos) {
    super(new PVector(xPos, yPos), 15, 1.4f, color(#3232FF));
  }
  
  void updateVelocity(PVector direction) {
    this.velocity.add(direction);
  }
  
  // We are using the velocity to calculate the missiles trajectory, therefore we cant reset it sooner.
  // This is undesired behaviour and will be fixed later
  void resetVelocity() {
    velocity.set(0, 0);
  }
}
