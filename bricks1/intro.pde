
//graphic display and mouse control ==============================================

void intro() {
  strokeWeight(3);
  theme.play();
  
  //background gif
  image(gif[gifFrameNum],0,0,width,height);
  if (frameCount % 5 == 0) gifFrameNum = gifFrameNum + 1;
  if (gifFrameNum == gifFrameTotal) gifFrameNum = 0;
  
  //logo
  writing("breakout",color((frameCount)*5%256),132,width/2,height/3);

  
  //mode --> GAME
  button("PLAY",width/2,height*0.7,200,125,40);
  
}

void introClick() {
  //mode --> GAME
  if (mouseX > width/2-125 && mouseX < width/2+125 && mouseY > height*0.7-75 && mouseY < height*0.7+75) {
    mode = GAME;
  }
}
