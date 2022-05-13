//brick formation ==================================================
void brickFormation() {
  int a = 0;
  while (a < brickN) {
    brickX[a] = (a%20)*42 + 100;
    brickY[a] = (a/20)*50 + 150; 
    alive[a] = true;
    a = a + 1;
  }
}

//round reset =======================================================
void reset() {
  //bricks reset ================================
  brickFormation();
  //coordinate reset ============================
  bx = width/2;
  by = 500;
  bd = 20;
  px = width/2;
  py = height;
  pd = 200;
  vx = 0;
  vy = 2;
  //reset stat
  lives = 3;
  score = 0;
}

//button short cuts ==================================================
void button(String function, float x, float y, float w, float h, int s) { 
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    fill(red);
    stroke(white);
  } else {
    fill(cream);
    stroke(black);
  }
  rect(x, y, w, h);

  writing(function, white, s, x, y);
}

//making texts =======================================================
void writing(String message, color c, int size, float x, float y) {
  textSize(size);
  fill(c);
  text(message, x, y);
}

//mouse click ========================================================
void mouseReleased() {
  if (mode == INTRO) {
    introClick();
  } else if (mode == GAME) {
    gameClick();
  } else if (mode == PAUSE) {
    pauseClick();
  } else if (mode == OVER) {
    gameoverClick();
  }
}

//graphics ===========================================================
void draw() {
  textFont(themeFont);
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == OVER) {
    gameover();
  }
}

//keyboard ===========================================================
void keyPressed() {
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
}

void keyReleased() {
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
}
