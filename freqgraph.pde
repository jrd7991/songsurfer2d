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
  float logb (float x, float b) {
    return (log(x) / log(b));
  }
  FreqGraph updateFreqs() {
    fftLin.forward( song.mix );
    //fftLog.forward( song.mix );
    for (int i = 0; i < size; i++) {
      float sum = 0;
      float sum2 = 0;
      for (int j = 0; j < size; j++) {
        float val = 0.5/(1+(logb(i, 1.047) - logb(j, 1.047))*(logb(i, 1.047) - logb(j, 1.047))/3);
        sum2 += val;
        sum += val*(fftLin.getBand((int) pow(1.047, j)));
      }
      data[i] += 0.18*(sum/sum2-data[i]);
    }
    return this;
  }
}