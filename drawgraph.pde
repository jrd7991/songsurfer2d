void drawGraph(int cx, int cy, int r, int s, float scalefactor, boolean lines, float colorJump, int colorShift, float angle ){

 for (int i = 0; i < s-1; i++) {
    //line(i*width/s,height-freqGraph.get(i)*scalefactor,(i+1)*width/s,height-freqGraph.get(i+1)*scalefactor);
   
    
    stroke(color((colorShift)*255*i/s %255, (colorShift + random(0,10))*255*i/s %255, (colorShift + random(0,100))*255*i/s %255));
    
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
    
    
    colorJump = colorJump + .1;
    colorShift = floor(colorJump) % 255;
    //println(colorShift);
   
 } 
 
 for (int i = 0; i < s-1; i++) {
 stroke(color(255));
    line(cx+(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s),cx+(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));
    line(cx-(r+freqGraph.get(i)*scalefactor)*sin(angle*i/s),cy+(r+freqGraph.get(i)*scalefactor)*cos(angle*i/s),cx-(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));
    
    
 }
 float sign = 1;
  
   if (rightside) {
     itheta++;
     if (itheta == s-1) rightside = !rightside;
   }
   else {
     itheta--;
     if (itheta == 0) rightside = !rightside;
     sign = -1;
   }
   
   stroke(0);
  strokeWeight(10);
  line(cx,cy,cx+sign*(r+freqGraph.get(itheta)*scalefactor)*sin(angle*itheta/s),cy+(r+freqGraph.get(itheta)*scalefactor)*cos(angle*itheta/s));
  strokeWeight(4);
  fill(255);
  ellipse(cx+sign*(r+freqGraph.get(itheta)*scalefactor)*sin(angle*itheta/s),cy+(r+freqGraph.get(itheta)*scalefactor)*cos(angle*itheta/s),15,15);
 
 fill(0);
 ellipse(cx,cy,2*r,2*r);
 //line(cx+(r+freqGraph.get(s-1)*scalefactor)*sin(angle),cy+(r+freqGraph.get(s-1)*scalefactor)*cos(angle),cx+(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));

  freqGraph.updateFreqs();


}