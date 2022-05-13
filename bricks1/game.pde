
//graphic display and mouse control ============================================

void game() {
  background(black);  

  //ceiling
  fill(white);
  rect(width/2, 100, width, 20);
  //stat display
  writing("Score:  " + score, white, 25, width*0.75, 45);
  writing("lives:  " + lives, white, 25, width/4, 45);
  //go the pause mode
  button("PAUSE", width/2, 45, 120, 60, 25);

  //paddle ===============================================================
  strokeWeight(3);
  stroke(blue);
  fill(oceanBLU); //draw paddle
  circle(px, py, pd);
  if (akey && px > 0) px = px - 5;//go left
  if (dkey && px < width) px = px + 5; //go right
  //ball =================================================================
  strokeWeight(1);
  fill(cream);
  stroke(darkBlue);
  circle(bx, by, bd);
  bx = bx + vx;
  by = by + vy;
  //fire ball: destroy an entire row
  if (score % 5 == 0 && score != 0 && score != 100) image(fireball, bx-bd, by-bd, 2*bd, 2*bd); //fireball
  //bouncing =============================================================
  if (dist(bx, by, px, py) < bd/2 + pd/2) { //ball bounce off paddle
    vx = (bx - px)/10;
    vy = (by - py)/10;

    bounce.rewind();
    bounce.play();
  } else if (by < bd/2+110) { //bounce off the top
    vy = vy * -1;
    bounce.rewind();
    bounce.play();
  } else if (bx < bd/2 || bx > width-bd/2) { //bounce off the side
    vx = vx * -1;
    bounce.rewind();
    bounce.play();
  } 
  if (by >= height-bd/2 && lives != 0) {    //decrease lives
    lives = lives - 1; 
    vy = vy * -1;
    bump.rewind();
    bump.play();
  }
  if (lives == 0) { //losing the game
    mode = OVER;  
    win = false;
    lose.rewind();
  }

  if (score == brickN) { //winning the game
    mode = OVER; 
    win = true;
    triumph.rewind();
  }

  //bricks ================================================================ 
  int a = 0;
  while (a < brickN) {
    if (alive[a] == true) {
      manageBrick(a);
    }
    a = a + 1;
  }
}

void gameClick() {
  if (mouseX > width/2-60 && mouseX < width/2+60 && mouseY > 15 && mouseY < 75 ) {
    mode = PAUSE;
    theme.pause();
  }
}

//other functions ===============================================================


void manageBrick(int i) {
  if (brickY[i] == 150) fill(purple);
  if (brickY[i] == 200) fill(blue);    
  if (brickY[i] == 250) fill(wine);    
  if (brickY[i] == 300) fill(yellow);
  if (brickY[i] == 350) fill(red);

  rect(brickX[i], brickY[i], brickd, 20); 

  if (dist(bx, by, brickX[i], brickY[i]) < bd/2 + brickd/2) { 
    if (score % 5 == 0 && score != 0 && score != brickN && i%brickN/5 > 1 && i%brickN/5 < brickN/5 - 2) { //when it's fireball
      for (int b = -2; b <= 2; b=b+1) {
        if (alive[i+b] == true) {
          alive[i+b] = false;
          score = score + 1;

          scoring.rewind();
          scoring.play();
        }
      }
    } else { //when it's not fireball --------------------------------------  
      vx = (bx - brickX[i])/10; //bounce
      vy = (by - brickY[i])/5; //bounce
      alive[i] = false;
      score = score + 1;

      scoring.rewind();
      scoring.play();
    }
  }
}
