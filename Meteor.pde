class Meteor {
  float speed;
  PImage meteor;
  int meteor_width, meteor_height;
  float posX;
  float posY;

  public Meteor(float speed) {
    this.speed = speed;
    meteor = loadImage("meteor.png");
    meteor_width = (int)AdaptableCalculations.calculateObjectSize(width, height, (float)(meteor.width / 10) );
    meteor_height = (int)AdaptableCalculations.calculateObjectSize(width, height, (float)(meteor.height / 10) );
    meteor.resize(meteor_width, meteor_height);
    int r_value = (int)random(1, 3);
    if (r_value == 1) {
      posX = random(meteor_width, meteor_width+100);
      posY = -random(100, 200);
    } else {
      //println(posX);
      posX = random(width-meteor_width-100, width-meteor_width*2);
      posY = -random(100, 200);
    }
  }

  public void meteorMovement(float time) {
    posY += speed;
    speed =  1 + cos(radians(time*3))*25;
    //println(speed);
    image(meteor, posX, posY);
    int r_value = (int)random(1, 3);



    if (posY > height && r_value==1) {
      posY = -random(100, 300);
      posX = random(meteor_width, meteor_width+100);
    } else if (posY > height && r_value==2) {
      posY = -random(100, 300);
      posX = random(width-meteor_width-100, width-meteor_width*2);
    }
  }
}
