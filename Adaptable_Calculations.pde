public static class AdaptableCalculations {


  public static float calculateNewX(float screen_width, float yourXvalue) {
    return ((float)screen_width/Constants.c_WIDTH*yourXvalue);
  }



  public static float calculateNewY(float screen_height, float yourYvalue) {
    return ((float)screen_height/Constants.c_HEIGHT*yourYvalue);
  }


  public static float calculateObjectSize(float screen_width, float screen_height, float yourValue) {
    return sqrt(((float)screen_width*(float)screen_height) / (Constants.c_WIDTH*Constants.c_HEIGHT/pow(yourValue, 2)));
  }
}
