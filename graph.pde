
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