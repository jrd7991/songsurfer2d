import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

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
  AudioPlayer jingle;
  FFT fftLin;
  FFT fftLog;
  FreqGraph(int s, String path, Minim m) {
    super(s);
    soundpath = path;
    minim = m;
    jingle = minim.loadFile(path, 1024);
    fftLin = new FFT( jingle.bufferSize(), jingle.sampleRate() );
    
  // calculate the averages by grouping frequency bands linearly. use 30 averages.
   // fftLin.linAverages( 512 );
  
  // create an FFT object for calculating logarithmically spaced averages
    fftLog = new FFT( jingle.bufferSize(), jingle.sampleRate() );
    fftLog.logAverages( 22, 3 );
    // size = fftLin.avgSize();
    // size = fftLin.specSize();
    size = 100;
    data = new float[size];
  }
  FreqGraph play() {
    jingle.loop();
    return this;
  }

  FreqGraph updateFreqs() {
  fftLin.forward( jingle.mix );
  fftLog.forward( jingle.mix );
  for (int i = 0; i < size; i++){
    float sum = 0;
    float sum2 = 0;
    for (int j = 0; j < size; j++) {
      float val = 0.5/(1+(logb(i,1.047) - logb(j,1.047))*(logb(i,1.047) - logb(j,1.047))/3);
      sum2 += val;
      sum += val*(fftLin.getBand((int) pow(1.047,j)));
      // System.out.println((int)logb(j,1.047));
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
  // frameRate(3);
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
