
//graphic display and mouse control ==============================================

void gameover() {
  writing("GAMEOVER",cyan,128,width/2,height/2); //shows gameover
  writing("Click Anywhere to Continue",white,24,width/2,height*0.3);
  
}

void gameoverClick() {
  mode = INTRO;
}
