import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import de.voidplus.soundcloud.*;

FreqGraph freqGraph;
Minim minim;
SoundCloud soundcloud;

float scalefactor = 5.0;
boolean lines = true;
float ColorJump = 0;
int ColorShift;
boolean drawThing = false;
float ftheta = 0;
int itheta = 0;
int speed = 10;
boolean rightside = true;
//int cx = 400;
//int cy = 250;
int cx = 0;
int cy = 0;
int r = 100;
int rotationspeed = 1;
int rotationtime = 0;

void setup() {
size(800,800);
    minim = new Minim(this);

  //soundcloud = new SoundCloud("6c3507a1755ff1781664a4cc4b5c99c7", "e7eacbb39c72372b092e6dabad8aa4e1");
  //ArrayList<Track> result = soundcloud.findTrack("TheFatRat - Monody");

  
   //freqGraph = new FreqGraph(500, result.get(0).getStreamUrl(),minim);
   freqGraph = new FreqGraph(500,"data/dream.mp3",minim);
  
  freqGraph.play();
  strokeWeight(4);
}

void draw() {
  
  pushMatrix();
  translate(400, 250);
  rotate(radians(rotationspeed*rotationtime));
  
  background(0);
  stroke(255);
  smooth();
  int s = freqGraph.size;

  float angle = 3.1415+1.3*3.1415/float(s);

  drawGraph(cx,cy,r, s, scalefactor, lines,ColorJump, ColorShift , angle);
  
  popMatrix();
  rotationtime = rotationtime+1;
}

void mouseClicked() {
  lines = !lines;
}

void keyReleased() {
  drawThing = !drawThing;
}