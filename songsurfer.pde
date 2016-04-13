import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

FreqGraph freqGraph;
Minim minim;

float scalefactor = 5.0;
boolean lines = true;
float ColorJump = 0;
int ColorShift;

int itheta = 0;
boolean rightside = true;
int cx = 400;
int cy = 250;
int r = 100;
void setup() {
size(800,800);
    minim = new Minim(this);
  freqGraph = new FreqGraph(500,"data/dream.mp3",minim);
  freqGraph.play();
  
  strokeWeight(4);
}

void draw() {
  background(0);
  stroke(255);
  smooth();
  int s = freqGraph.size;
  float angle = 3.1415;
  drawGraph(cx,cy,r, s, scalefactor, lines,ColorJump, ColorShift , angle);
}

void mouseClicked() {
  lines = !lines;
}