
//graphic display and mouse control ============================================

void game() {
  background(black);  
  stroke(blue);
  
  //ceiling
  fill(white);
  rect(width/2,100,width,20);
  
  //paddle ===============================================================
  strokeWeight(3);
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
  //bouncing =============================================================
  if (dist(bx, by, px, py) < bd/2 + pd/2) { //ball bounce off paddle
    vx = (bx - px)/10;
    vy = (by - py)/10;
  } else if (by < bd/2+110) { //bounce off the top
    vy = vy * -1;
  } else if (bx < bd/2 || bx > width-bd/2) { //bounce off the side
    vx = vx * -1;
  } 
  if (by >= height-bd/2) mode = OVER; //gameover
  
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
}

//other functions ===============================================================


void manageBrick(int i) {
  if (brickY[i] == 150) fill(purple);
  if (brickY[i] == 200) fill(blue);    
  if (brickY[i] == 250) fill(wine);    
  if (brickY[i] == 300) fill(yellow);
  if (brickY[i] == 350) fill(red);

  rect(brickX[i], brickY[i], brickd,20); 

  if (dist(bx, by, brickX[i], brickY[i]) < bd/2 + brickd/2) { //hitting a brick
    vx = (bx - brickX[i])/10; //bounce
    vy = (by - brickY[i])/10+(by-brickY[i])/5; //bounce
    //removing brick -------------------------------------
    alive[i] = false;
  }
}
