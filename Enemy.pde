class Enemy {

  PImage enemy_img;
  float position_X, position_Y;
  float image_width, image_height;
  int random_pos_value=0;
  boolean is_alive;
  boolean is_clickable;

  public Enemy(PImage img, float position_X, float position_Y) {
    this.position_X=position_X;
    this.position_Y=position_Y;
    this.enemy_img = img;
    this.image_width = AdaptableCalculations.calculateNewX(width, 100);
    this.image_height = 0;
    this.random_pos_value = (int)random(1, 10);
    this.is_alive = true;
    this.is_clickable = false;
    scale_= AdaptableCalculations.calculateObjectSize(width, height, scale_);
  }

  float scale_= 0;
  public void enemyApperance(int mole_Loc) {
    if (mole_Loc == this.random_pos_value) {
      //scale_+=AdaptableCalculations.calculateObjectSize(width, height, 0.1);
      scale_ = lerp(scale_, AdaptableCalculations.calculateObjectSize(width, height, 1), AdaptableCalculations.calculateObjectSize(width, height, 0.2));
      is_clickable=true;
      scale(scale_);

      myyCylinder();
      if (scale_>AdaptableCalculations.calculateObjectSize(width, height, 1)) {
        scale_ = AdaptableCalculations.calculateObjectSize(width, height, 1);
      }
    } else {
      scale(scale_);
      myyCylinder();
      //scale_-=AdaptableCalculations.calculateObjectSize(width, height, 0.4);
      scale_ = lerp(scale_, AdaptableCalculations.calculateObjectSize(width, height, 0), AdaptableCalculations.calculateObjectSize(width, height, 0.2));

      if (scale_<0) {
        scale_=0;
        is_clickable=false;
      }


      if (frameCount%30 == 0) {
        this.random_pos_value = (int)random(1, 10);
      }
    }
  }


  void myyCylinder()
  {

    int h = 100, r = 40;
    int pieces = 360;
    float angle = 360 / pieces;
    int w = enemy_img.width;

    beginShape(QUADS);
    texture(enemy_img);

    for (int i = 0; i < pieces; i++)
    {
      vertex(r * cos(radians(i * angle)), -h/2, r * sin(radians(i * angle)), i * w / pieces, 0);
      vertex(r * cos(radians((i + 1)*angle)), -h/2, r * sin(radians((i + 1)*angle)), (i+1) * w / pieces, 0);
      vertex(r * cos(radians((i + 1)*angle)), h/2, r * sin(radians((i + 1)*angle)), (i+1) * w / pieces, enemy_img.height);
      vertex(r * cos(radians(i * angle)), h/2, r * sin(radians(i * angle)), i * w / pieces, enemy_img.height);
    }

    endShape();
  }
}
