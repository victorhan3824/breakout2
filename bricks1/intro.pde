
//graphic display and mouse control ==============================================

void intro() {
  strokeWeight(3);
  image(brickWall,0,0,1000,800);
  
  //logo
  if (frameCount % 10 == 0) writing("breakout",white,132,width/2,height/3);
  else writing("breakout",black,128,width/2,height/3);
  
  //mode --> GAME
  button("PLAY",width/2,height*0.7,200,125,40);
  
}

void introClick() {
  //mode --> GAME
  if (mouseX > width/2-125 && mouseX < width/2+125 && mouseY > height*0.7-75 && mouseY < height*0.7+75) {
    mode = GAME;
    reset();
  }
}
