import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


FreqGraph freqGraph;
Minim minim;

float scalefactor = 5.0;

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
  for (int i = 0; i < s-1; i++) {
    line(i*width/s,height-freqGraph.get(i)*scalefactor,(i+1)*width/s,height-freqGraph.get(i+1)*scalefactor);
  }
  freqGraph.updateFreqs();
}