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
boolean mouthCirc = false;
boolean autorot = false;
int ColorShift;
boolean drawThing = false;
float ftheta = 0;
int itheta = 0;
boolean rightside = true;
int cx = 400;
int cy = 250;
int r = 100;
float rot = 0;
float dist = 0.5;
float radius = 100;
float rotsign = 1;
Surfarray sarray;
float scale2 = 10.0;
int beatlimiter = 40;
int beatfreq = 12;
  
  
void setup() {
size(800,800);
    minim = new Minim(this);
 sarray = new Surfarray(500);
 //soundcloud = new SoundCloud("6c3507a1755ff1781664a4cc4b5c99c7", "e7eacbb39c72372b092e6dabad8aa4e1");
 //ArrayList<Track> result = soundcloud.findTrack("kaskade");
 // //ArrayList<Track> result = soundcloud.findTrack("don't let me down");
 //  freqGraph = new FreqGraph(500, result.get(0).getStreamUrl(),minim);
   freqGraph = new FreqGraph(500,"data/disarmyou.mp3",minim);
  
  freqGraph.play();
  strokeWeight(4);
  
}

void draw() {
  background(0);
  stroke(255);
  smooth();
  int s = freqGraph.size;
  float angle = 3.1415+1.3*3.1415/float(s);
  drawGraph(cx,cy,r, s, scalefactor, lines,ColorJump, ColorShift , angle);
  
  //To try to implement a drop lines only when one hears the beat.
  println(freqGraph.data[beatfreq]);
  lines = beatChange(lines);

}

void mouseClicked() {
  lines = !lines;
}

void keyPressed() {
  if (key == ' ') {
  drawThing = !drawThing;
  }
  else if (key == 'r') {
    autorot = !autorot;
  }else if (key == 'm') {
    mouthCirc = !mouthCirc;
  }
  else if (key == 'k') {
    //freqGraph.song.pause();
    //print("HERE");
    freqGraph.song.cue(160000);
    //freqGraph.song.play();
  }

}