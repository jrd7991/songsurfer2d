class Surfarray {
  ArrayList<Float> arr;
  int maxlength;
  Surfarray(int max) {
      maxlength = max;
      arr = new ArrayList<Float>();
  }
  Surfarray insert(Float f) {
    arr.add(0,f);
    if (arr.size() > maxlength) arr.remove(arr.size()-1);
    return this;
  }
  float get(int i) {
    return sqrt(arr.get(i));
  }
}