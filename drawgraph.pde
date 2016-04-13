void drawGraph(int cx, int cy, int r, int s, float scalefactor, boolean lines, float colorJump, int colorShift, float angle ){

 for (int i = 0; i < 2*s; i++) {

    stroke(color((colorShift)*255*i/s %255, (colorShift + random(0,10))*255*i/s %255, (colorShift + random(0,100))*255*i/s %255));
    
    if (lines) {
      line(cx,cy,cx+(r+freqGraph.get(i)*scalefactor)*sin(angle*(i)/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*(i)/s));
     }
    
    colorJump = colorJump + .1;
    colorShift = floor(colorJump) % 255;
    //println(colorShift);
   
 } 
 
 for (int i = 0; i < 2*s; i++) {
 stroke(color(255));
    line(cx+(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s),cx+(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));
   
 }
 float sign = 1;
  
   itheta++;
   if (itheta > 2*s) itheta = 0;
   if (drawThing) {
   stroke(0);
  strokeWeight(10);
  line(cx,cy,cx+sign*(r+freqGraph.get(itheta)*scalefactor)*sin(angle*itheta/s),cy+(r+freqGraph.get(itheta)*scalefactor)*cos(angle*itheta/s));
  strokeWeight(4);
  fill(255);
  ellipse(cx+sign*(r+freqGraph.get(itheta)*scalefactor)*sin(angle*itheta/s),cy+(r+freqGraph.get(itheta)*scalefactor)*cos(angle*itheta/s),15,15);
   }
 fill(0);
 stroke(255);
 ellipse(cx,cy,2*r,2*r);
 //line(cx+(r+freqGraph.get(s-1)*scalefactor)*sin(angle),cy+(r+freqGraph.get(s-1)*scalefactor)*cos(angle),cx+(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));

  freqGraph.updateFreqs();


}