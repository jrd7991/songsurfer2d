float nodeDistances(float x1, float y1, float x2, float y2){
  float distance = 0;
  distance = sqrt(((y2-y1)*(y2-y1))+((x2-x1)*(x2-x1)));
  return distance;
}