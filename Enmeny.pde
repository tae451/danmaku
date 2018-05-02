class Enemy extends GameObject {
  
  boolean hitBull = false; //Am I touching a bullet right now???
  int hp;
  PImage sprite;
  int alivetime;
  
  Enemy(int locx, int locy, PImage _sprite, int _wx, int _wy) {
    pos.x = locx;
    pos.y = locy;
    sprite = _sprite;
    alivetime = 0;
    
    vel.x = random(-2.5, 2.5);
    vel.y = random(1, 3);
    
    wx = _wx;
    wy = _wy;
    
    hp = 1;
    
    sprite.resize(wx, wy);
  }
  
  void move() {
    pos.add(vel);
    
    //Test hitbox with stuff
    int i = 0;
    while (i < engine.size()) {
      GameObject hit = engine.get(i);
      //Test for hit if the object is a bullet
      if (hit instanceof PlayerBullet) {
        if (isColliding(hit)) {
          hp-=1;
          hit.hp -= 3;
        }
      }
      i++;
    }
    alivetime++;
    if (hp < 1) {
      explode(pos.x, pos.y, 5);
    }
  }
  
  void show() {
    fill(125,175,200);
    stroke(0);
    image(sprite, pos.x, pos.y);
  }
  
  boolean isDead() {
    return(pos.y > height+100 || pos.x > botX+115 || pos.x < topX-115 || pos.y < -100 || hp <1); 
  }
}