import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//test

float logb (float x, float b) {
  return (log(x) / log(b));
}

class Graph {
  float[] data;
  int size;
  Graph(int s) {
    size = s;
    data = new float[size];
  }
  float get(int i) {
    return data[i];
  }
}

class FreqGraph extends Graph {
  String soundpath;
  Minim minim;  
  AudioPlayer song;
  FFT fftLin;
  FreqGraph(int s, String path, Minim m) {
    super(s);
    soundpath = path;
    minim = m;
    song = minim.loadFile(path, 1024);
    fftLin = new FFT( song.bufferSize(), song.sampleRate() );
    size = 100;
    data = new float[size];
  }
  FreqGraph play() {
    song.loop();
    return this;
  }

  FreqGraph updateFreqs() {
  fftLin.forward( song.mix );
  //fftLog.forward( song.mix );
  for (int i = 0; i < size; i++){
    float sum = 0;
    float sum2 = 0;
    for (int j = 0; j < size; j++) {
      float val = 0.5/(1+(logb(i,1.047) - logb(j,1.047))*(logb(i,1.047) - logb(j,1.047))/3);
      sum2 += val;
      sum += val*(fftLin.getBand((int) pow(1.047,j)));
    }
    data[i] += 0.1*(sum/sum2-data[i]);
  }
    return this;
  }
}


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