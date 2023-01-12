import com.jogamp.opengl.GLProfile;
{
  GLProfile.initSingleton();
}
PFont myFont;

PImage background_img;
PImage background_menu_img;
PImage scoreboard_img;
PImage retry_image;

PImage meteor;

PImage cross_img;


PImage img1, img2, img3, img4, img5, img6, img7, img8, img9;
ArrayList<Enemy> enemyList= new ArrayList<Enemy>();

ArrayList<Meteor> meteorList;


Enemy enem1, enem2, enem3, enem4, enem5, enem6, enem7, enem8, enem9;
Time o_time;
int score;
int highest_score = 0;
int Total_enemy;
PImage lightsaber_on_img, lightsaber_off_img;
int MeteorCount=30;
boolean is_game_over=false;
void setup() {
  size(1000, 500, P3D);
  fullScreen(P3D);
  background(255);


  // Show fonts
  //for (String i : PFont.list()) {
  //  println(i);
  //}
  score = 0;
  Total_enemy = 9;
  meteorList = new ArrayList<Meteor>();
  for (int i =0; i< MeteorCount; i++ ) {

    meteorList.add(new Meteor(random(1, 50)));
    //meteorList.get(i).posY=-random(100,200);
  }

  myFont = createFont("Arial-BoldMT", 100, true);
  textFont(myFont);

  //fullScreen(P3D);
  cross_img = loadImage("cross.png");
  cross_img.resize(64, 64);



  lightsaber_on_img = loadImage("light saber on.png");
  lightsaber_on_img.resize(64, 64);

  lightsaber_off_img = loadImage("light saber off.png");
  lightsaber_off_img.resize(64, 64);
  scoreboard_img= loadImage("game_over_score.png");
  scoreboard_img.resize((int)AdaptableCalculations.calculateObjectSize(width, height, scoreboard_img.width/2), (int)AdaptableCalculations.calculateObjectSize(width, height, scoreboard_img.height/2));
  retry_image = loadImage("retry.png");
  retry_image.resize((int)AdaptableCalculations.calculateObjectSize(width, height, retry_image.width/2), (int)AdaptableCalculations.calculateObjectSize(width, height, retry_image.height/2));

  //String[] lines = loadStrings("highest_score.txt");
  //println("there are " + lines.length + " lines");
  //for (int i = 0; i < lines.length; i++) {
  //  highest_score = Integer.parseInt(lines[i]);
  //}
  
  highest_score = getHighestScore();
  float high_score_text_x = AdaptableCalculations.calculateNewX(width, 120);
  float high_score_text_y = AdaptableCalculations.calculateNewY(height, (70)); // 70

  text(highest_score, high_score_text_x, high_score_text_y);
  surface.setTitle("WHACK-A-PSYCHO");
  o_time = new Time(30);
  background_img = loadImage("background2.png");
  background_menu_img = loadImage("background_menu.png");
  //icon = loadImage("alien.png");
  background_menu_img.resize(width, height);
  cursor(lightsaber_off_img);

  noStroke();

  //img.resize(64, 64);

  img1 = loadImage("thanos.png");

  img2 = loadImage("alien.png");
  img3 = loadImage("darth maul.png");
  img4 = loadImage("darth vader.png");
  img5 = loadImage("ebony maw.png");
  img6 = loadImage("knull.png");
  img7 = loadImage("palpatine.png");
  img8 = loadImage("snoke.png");
  img9 = loadImage("venom.png");
  //---------------
  enem1=new Enemy(img1, AdaptableCalculations.calculateNewX(width, 290), AdaptableCalculations.calculateNewY(height, 140));
  enem2=new Enemy(img2, AdaptableCalculations.calculateNewX(width, 470+25), AdaptableCalculations.calculateNewY(height, 140));
  enem3=new Enemy(img3, AdaptableCalculations.calculateNewX(width, 600+110), AdaptableCalculations.calculateNewY(height, 140));
  //---------------
  enem4=new Enemy(img4, AdaptableCalculations.calculateNewX(width, 290), AdaptableCalculations.calculateNewY(height, 260));
  enem5=new Enemy(img5, AdaptableCalculations.calculateNewX(width, 470+25), AdaptableCalculations.calculateNewY(height, 260));
  enem6=new Enemy(img6, AdaptableCalculations.calculateNewX(width, 600+110), AdaptableCalculations.calculateNewY(height, 260));
  //---------------
  enem7=new Enemy(img7, AdaptableCalculations.calculateNewX(width, 280), AdaptableCalculations.calculateNewY(height, 380));
  enem8=new Enemy(img8, AdaptableCalculations.calculateNewX(width, 450+40), AdaptableCalculations.calculateNewY(height, 380));
  enem9=new Enemy(img9, AdaptableCalculations.calculateNewX(width, 600+110), AdaptableCalculations.calculateNewY(height, 380));

  //cursor(lightsaber_off_img);

  enemyList.add(enem1);
  enemyList.add(enem2);
  enemyList.add(enem3);
  enemyList.add(enem4);
  enemyList.add(enem5);
  enemyList.add(enem6);
  enemyList.add(enem7);
  enemyList.add(enem8);
  enemyList.add(enem9);

  //time=30;
}




/*
*
 *
 *
 *
 *
 *
 */
float rotating_angle=0;
boolean last_mouse_clicked= false;
void draw() {



  if (mousePressed == true  && !last_mouse_clicked) {
    last_mouse_clicked =true;
    cursor(lightsaber_on_img);
  } else if (  mousePressed == false && last_mouse_clicked) {
    last_mouse_clicked =false;

    cursor(lightsaber_off_img);
  }

  //fill(0);
  //translate(0,0,mouseY*1);
  background_img.resize(width, height);
  image(background_img, 0, 0);




  //m1.meteorMovement(o_time.getTime());
  for (int i =0; i< 10; i++ ) {
    meteorList.get(i).meteorMovement(o_time.getTime());
  }
  game_info_text();
  create_characters();
}

int random_location;


void create_characters() {
  //fill(0);

  checkGameIsOver();
  rotating_angle-=5;

  //cursor(lightsaber_off_img);
  for (int i=0; i<enemyList.size(); i++) {
    if (enemyList.get(i).is_alive) {

      //translate(AdaptableCalculations.calculateNewX(width, enemyList.get(i).position_X), AdaptableCalculations.calculateNewY(height, enemyList.get(i).position_Y), 0);
      //rotating_angle-=.9;

      //println(enemyList.get(i).is_alive);


      //circle(enemyList.get(i).position_X, enemyList.get(i).position_Y, 100 * enemyList.get(i).scale_);
      if (mousePressed == true) {
        //cursor(lightsaber_on_img);
        if (dist(enemyList.get(i).position_X, enemyList.get(i).position_Y, mouseX, mouseY) < 100 * enemyList.get(i).scale_)
        {
          score +=random(4000);
          enemyList.get(i).is_alive = false;
          enemyList.remove(i);
          Total_enemy--;
          background(0, 255, 0);
          //checkGameIsOver();
          return;
        }
      }

      pushMatrix();

      translate(enemyList.get(i).position_X, enemyList.get(i).position_Y, 0);
      rotateY(radians(rotating_angle));
      
      //translate(AdaptableCalculations.calculateNewX(width, enemyList.get(i).position_X), AdaptableCalculations.calculateNewY(height, enemyList.get(i).position_Y), 0);
      translate(0, 0, 0);
      enemyList.get(i).enemyApperance(random_location);
      popMatrix();

      //println( dist(enemyList.get(i).position_X, enemyList.get(i).position_X, lastX, lastY) );
    }
  }



  if (frameCount%60 == 0) {
    random_location = (int)random(1, 10);
  }
}






void checkGameIsOver() {


  if (o_time.getTime() > 0) {

    if (enemyList.size() < 1) {
      //println("You wonr");
      saveHighestScore();
      game_over_menu();
      is_game_over=true;

      //noLoop();
      //exit();
    }
  } else {
    //println("---------");
    saveHighestScore();
    enemyList.removeAll(enemyList);

    game_over_menu();
    is_game_over=true;
  }
}


void game_info_text() {
  //println(  sqrt(((float)width*(float)height) / (Constants.c_WIDTH*Constants.c_HEIGHT/pow(30,2)))  );
  textSize(AdaptableCalculations.calculateObjectSize(width, height, 25));
  float high_score_text_x = AdaptableCalculations.calculateNewX(width, 120);
  float high_score_text_y = AdaptableCalculations.calculateNewY(height, (70)); // 70
  //fill(255);

  text(highest_score, high_score_text_x, high_score_text_y);

  //textSize(height/50+width/50);
  textSize(AdaptableCalculations.calculateObjectSize(width, height, 25));

  float current_score_text_x=AdaptableCalculations.calculateNewX(width, 880); ///860
  float current_score_text_y=AdaptableCalculations.calculateNewY(height, 70);
  text(score, current_score_text_x, current_score_text_y);

  textSize(AdaptableCalculations.calculateObjectSize(width, height, 30));

  text("Enemy Left:" + Total_enemy, (float)width/2, AdaptableCalculations.calculateNewY(height, 80));

  o_time.displayRemainingTime();
}





void saveHighestScore() {
  String[] saveHighScore=new String[1];
  saveHighScore[0]=str(score);
  if (score > highest_score)
    saveStrings("highest_score.txt", saveHighScore);
}


String[] getStringArray(ArrayList<Float> list) {
  String[] stringa = new String[list.size()];
  for (int i=0; i<list.size(); i++) {
    stringa[i] = String.valueOf(list.get(i));
  }
  return stringa;
}


int getHighestScore() {

  String[] lines = loadStrings("highest_score.txt");
  //println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) {
    highest_score = Integer.parseInt(lines[i]);
  }
  return highest_score;
}





void game_over_menu() {

  highest_score = getHighestScore();

  cursor(ARROW);
  //noLoop();

  image(background_menu_img, 0, 0);





  image(cross_img, width-AdaptableCalculations.calculateNewX(width, 64+10), AdaptableCalculations.calculateNewY(height, 10));
  //delay(2000);
  image(scoreboard_img, width/2-scoreboard_img.width/2, height/2- scoreboard_img.height/2 );



  image(retry_image, width/2 -retry_image.width/2, height/2 + scoreboard_img.height/2 + AdaptableCalculations.calculateNewY(height, 20));

  textSize(AdaptableCalculations.calculateObjectSize(width, height, 25));
  float high_score_text_x = width/2;
  float high_score_text_y = height/2 - AdaptableCalculations.calculateNewY(height, 24); // 70
  //fill(255);

  text(highest_score, high_score_text_x, high_score_text_y);



  textSize(AdaptableCalculations.calculateObjectSize(width, height, 25));
  float current_score_text_x= width / 2;
  float current_score_text_y= height/2 + AdaptableCalculations.calculateNewY(height, 60);
  //println(current_score_text_y);
  text(score, current_score_text_x, current_score_text_y);
  //if (
  //    mouseX > (width/2 -retry_image.width/2) &&
  //    mouseX < (width/2 -retry_image.width/2) + retry_image.width &&
  //    mouseY > height/2 + scoreboard_img.height/2 + AdaptableCalculations.calculateNewY(height, 20)  &&
  //    mouseY < (height/2 + scoreboard_img.height/2 + AdaptableCalculations.calculateNewY(height, 20)+retry_image.height)
  //    ){
  //    cursor(ARROW);
  //    }

  if (
    mouseX > (width/2 -retry_image.width/2) &&
    mouseX < (width/2 -retry_image.width/2) + retry_image.width &&
    mouseY > height/2 + scoreboard_img.height/2 + AdaptableCalculations.calculateNewY(height, 20)  &&
    mouseY < (height/2 + scoreboard_img.height/2 + AdaptableCalculations.calculateNewY(height, 20)+retry_image.height)
    )
  {
    cursor(HAND);
  } else if (
    mouseX > width-AdaptableCalculations.calculateNewX(width, 64+10) &&
    mouseX <  width-AdaptableCalculations.calculateNewX(width, 64+10) + cross_img.width &&
    mouseY > AdaptableCalculations.calculateNewY(height, 10) &&
    mouseY < AdaptableCalculations.calculateNewY(height, 10) + cross_img.height
    ) {
    cursor(HAND);
  }



  if (mousePressed == true && is_game_over) {
    if (
      mouseX > (width/2 -retry_image.width/2) &&
      mouseX < (width/2 -retry_image.width/2) + retry_image.width &&
      mouseY > height/2 + scoreboard_img.height/2 + AdaptableCalculations.calculateNewY(height, 20)  &&
      mouseY < (height/2 + scoreboard_img.height/2 + AdaptableCalculations.calculateNewY(height, 20)+retry_image.height) &&
      is_game_over
      ) {
      is_game_over=false;
      setup();
    } else if (
      mouseX > width-AdaptableCalculations.calculateNewX(width, 64+10) &&
      mouseX <  width-AdaptableCalculations.calculateNewX(width, 64+10) + cross_img.width &&
      mouseY > AdaptableCalculations.calculateNewY(height, 10) &&
      mouseY < AdaptableCalculations.calculateNewY(height, 10) + cross_img.height
      )
    {
      exit();
    }
  }
}
