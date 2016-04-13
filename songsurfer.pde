import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

FreqGraph freqGraph;
Minim minim;

float scalefactor = 5.0;

int cx = 400;
int cy = 250;
int r = 100;
void setup() {
size(800,500);
    minim = new Minim(this);
  freqGraph = new FreqGraph(500,"data/dream.mp3",minim);
  freqGraph.play();
}

void draw() {
  background(0);
  fill(255);
  stroke(255);
  smooth();
  int s = freqGraph.size;
  ellipse(cx,cy,2*r,2*r);
  float angle = 2*3.1415;
  for (int i = 0; i < s-1; i++) {
    //line(i*width/s,height-freqGraph.get(i)*scalefactor,(i+1)*width/s,height-freqGraph.get(i+1)*scalefactor);
    line(cx+(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s),cx+(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));
  }
  freqGraph.updateFreqs();
}