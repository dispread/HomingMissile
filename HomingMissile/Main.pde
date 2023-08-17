import java.util.HashSet;

// This is stupid but I could not get it working otherwise
HashSet<Character> keysPressed = new HashSet<>();

Player player;
Missile missile;

void setup() {
  size(800, 600);
  player = new Player(width/2, height/2);
  missile = new Missile(width/2, height/8*7, player, 1.5f);
}

void draw() {
  background(100);
  handleInputs();
  
  player.move();
  
  // If the player is faster than the missile predictive targetting breaks down
  if(missile.speed >= player.speed) {
    missile.predictiveTargetting();
  } else {
    missile.purePursuit();
  }
  
  missile.display();
  player.display();
  
  missile.move();
}

void handleInputs() {
  for(Character pressed : keysPressed) {
    if(pressed == 'w') {
      player.updateVelocity(new PVector(0, -1));
    }
    if(pressed == 's') {
      player.updateVelocity(new PVector(0, 1));
    }
    if(pressed == 'a') {
      player.updateVelocity(new PVector(-1, 0));
    }
    if(pressed == 'd') {
      player.updateVelocity(new PVector(1, 0));
    }
  }
}

void keyPressed() {
  keysPressed.add(key);
}

void keyReleased() {
  keysPressed.remove((Character)key);
}
