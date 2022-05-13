
//graphic display and mouse control ==============================================

void gameover() {
  if (win) {
    writing("You Won!",cyan,128,width/2,height/2); //shows gameover
    triumph.play();
  } else {
    writing("You Lost :(",cyan,128,width/2,height/2); //shows gameover
    lose.play();  
  }
  
  writing("Click Anywhere to Continue",white,24,width/2,height*0.3);
  
  writing("Score: " + score, white, 24, width/2,height*0.6);
}

void gameoverClick() {
  mode = INTRO;
  
  reset();
}
