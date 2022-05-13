
//graphic display and mouse control ==============================================

void pause() {
  //go the game mode
  button("RESUME",width/2,45,120,60,25);
    
}

void pauseClick() {
  if (mouseX > width/2-60 && mouseX < width/2+60 && mouseY > 15 && mouseY < 75 ) {
    mode = GAME;  
  }  
}
