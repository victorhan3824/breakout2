//bricks pt 1

//Mode framework ==============================================================
int mode; 
final int INTRO = 0;
final int GAME  = 1;
final int PAUSE = 2;
final int OVER  = 3;
//game variables ==============================================================
float bx, by, bd, vx, vy, px, py, pd;

//bricks variables ============================================================
int[] brickX;
int[] brickY;
int brickd, brickN;
boolean[] alive;

//non-game variables ==========================================================
boolean akey, dkey;

//color pallette ==============================================================
color black    = #001219;
color darkBlue = #1D3557;
color oceanBLU = #005F73;
color blue     = #0A9396;
color cyan     = #94D2BD;
color cream    = #E9D8A6;
color yellow   = #EE9B00;
color gray     = #6E6E6F;
color bloodOG  = #BB3E03;
color red      = #AE2012;
color wine     = #9B2226;
color purple   = #841FD8;
color lightGR  = #67F720;
color white    = #F1FAEE;

//Fonts and images ============================================================
PFont themeFont;
PImage brickWall;

//set up ======================================================================
void setup() {
  //bricks set up ===================================================
  brickd = 40;
  brickN = 100;
  brickX = new int[brickN];
  brickY = new int[brickN];
  alive = new boolean[brickN];

  brickFormation(); //look for this in utilities

  //general set up ===================================================
  size(1000, 800);
  mode = 0;
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  //game variables set up ============================================
  bx = width/2;
  by = 500;
  bd = 20;
  px = width/2;
  py = height;
  pd = 200;
  vx = 0;
  vy = 2;

  //font and images set up ===========================================
  themeFont = createFont("font.ttf", 69);
  brickWall = loadImage("brick.jpg");
}
