public class Time {
  int time;

  public Time(int time) {
    this.time = time;
  }


  public int getTime() {
    return this.time;
  }




  void displayRemainingTime() {
    textAlign(CENTER);

    textSize(AdaptableCalculations.calculateObjectSize(width, height, 30));
    //fill(255);
    text("Time Left:" + time, (float)width/2, AdaptableCalculations.calculateNewY(height, 40));
    if (this.time > 0 && frameCount%60 ==0) {
      this.time = this.time - 1;
    }
  }
}
