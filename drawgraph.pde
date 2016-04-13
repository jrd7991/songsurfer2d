void drawGraph(int cx, int cy, int r, int s, float scalefactor, boolean lines, float ColorJump, int ColorShift, float angle ){

 for (int i = 0; i < s-1; i++) {
    //line(i*width/s,height-freqGraph.get(i)*scalefactor,(i+1)*width/s,height-freqGraph.get(i+1)*scalefactor);
   
    stroke(color(255));
    line(cx+(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s),cx+(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));
    line(cx-(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s),cx-(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));
    
    
    stroke(color((ColorShift)*255*i/s %255, (ColorShift + random(0,10))*255*i/s %255, (ColorShift + random(0,100))*255*i/s %255));
    
    if (lines) {
      line(cx,cy,cx+(r+freqGraph.get(i)*scalefactor)*sin(angle*(i)/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*(i)/s));
      line(cx,cy,cx-(r+freqGraph.get(i)*scalefactor)*sin(angle*(i)/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*(i)/s));
    }
    
    if (i == 1) {
      
      if (lines) {
        line(cx,cy,cx,cy+(r+freqGraph.get(i)*scalefactor));
      }
      stroke(255);
      line(cx+(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s),cx-(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s));
    
    }
    
    if (i == s-2) {
      if (lines) {
        line(cx,cy,cx,cy-(r+freqGraph.get(i)*scalefactor));
      }
      stroke(255);
      line(cx+(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s),cx-(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s));
   
    }
    
    
    ColorJump = ColorJump + .01;
    ColorShift = floor(ColorJump) % 255;
    println(ColorShift);
   
 } 

 fill(255);
 ellipse(cx,cy,2*r,2*r);
 //line(cx+(r+freqGraph.get(s-1)*scalefactor)*sin(angle),cy+(r+freqGraph.get(s-1)*scalefactor)*cos(angle),cx+(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));

  freqGraph.updateFreqs();


}