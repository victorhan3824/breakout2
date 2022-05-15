import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

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
int score, lives;
boolean win;
PImage[] gif;
int gifFrameTotal, gifFrameNum;

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

//Fonts and images and sound ==================================================
PFont themeFont;
PImage brickWall, fireball;
Minim minim;
AudioPlayer triumph, lose, bounce, scoring, bump, theme;

//set up ======================================================================
void setup() {
  //bricks set up ===================================================
  brickd = 40;
  brickN = 90;
  brickX = new int[brickN];
  brickY = new int[brickN];
  alive = new boolean[brickN];

  brickFormation(); //look for this in utilities
  //gif set up =======================================================
  gifFrameTotal = 3;
  gif = new PImage[gifFrameTotal];
  int i = 0;
  while (i < gifFrameTotal) {
    gif[i] = loadImage("frame_"+i+"_delay-0.5s.gif");
    i = i + 1;
  }
  print(gif);

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
  fireball = loadImage("fireball.png");
  //stat setup =======================================================
  score = 0;
  lives = 3;
  
  //sound stuff ======================================================
  minim = new Minim(this);
  triumph = minim.loadFile("win.mp3");
  bounce = minim.loadFile("bounce.mp3");
  scoring = minim.loadFile("goal.wav");
  bump = minim.loadFile("bump.wav");
  lose = minim.loadFile("gameover.wav");
  theme = minim.loadFile("theme.mp3");
  
}
