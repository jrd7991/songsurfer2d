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
  stroke(255);
  smooth();
  int s = freqGraph.size;
  int shift = 0;
  
  float angle = 3.1415;
  for (int i = 0; i < s-1; i++) {
    //line(i*width/s,height-freqGraph.get(i)*scalefactor,(i+1)*width/s,height-freqGraph.get(i+1)*scalefactor);
   
    stroke(color(255));
    line(cx+(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s),cx+(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));
    line(cx-(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s),cx-(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));
    
    
    stroke(color(255,(shift)*255*i/s % 255,255*i/s));
    
    line(cx,cy,cx+(r+freqGraph.get(i)*scalefactor)*sin(angle*(i)/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*(i)/s));
    line(cx,cy,cx-(r+freqGraph.get(i)*scalefactor)*sin(angle*(i)/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*(i)/s));
    
    fill(255);
    ellipse(cx,cy,2*r,2*r);
    shift = shift+1;
    shift = shift % 255;
   
} 
    //line(cx+(r+freqGraph.get(s-1)*scalefactor)*sin(angle),cy+(r+freqGraph.get(s-1)*scalefactor)*cos(angle),cx+(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));

  freqGraph.updateFreqs();
}