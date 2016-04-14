
class Graph {
  float[] data;
  int size;
  Graph(int s) {
    size = s;
    data = new float[size];
    
  }
  float get(int i) {
    if (i == data.length*2) return data[0];
    if (i >= data.length) return data[data.length*2-i-1];
    return data[i];
  }
  
}