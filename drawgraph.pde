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
 //  //ftheta %= (2.0*s);
   //itheta = floor(ftheta);
   ////println(itheta + " itheta   " + ftheta + " is ftheta");
   //float x1 = (r+freqGraph.get(itheta)*scalefactor)*sin(angle*itheta/s);
   //float y1 = (r+freqGraph.get(itheta)*scalefactor)*cos(angle*itheta/s); 
   //float x2 = (r+freqGraph.get(itheta+1)*scalefactor)*sin(angle*(itheta+1)/s);
   //float y2 = (r+freqGraph.get(itheta+1)*scalefactor)*cos(angle*(itheta+1)/s);
   
   //float dx = x1-x2;
   ////println("dx" + dx);
   //float dy = y1-y2;
   //if (! Float.isNaN(sqrt(dx*dx+dy*dy))) {
   //dist = dist*0.8+0.2*sqrt(dx*dx+dy*dy);
   //}
   
   ////println("ftheta is + " +ftheta + " , dist is " + dist);
   //ftheta += 5.0/dist;
   
   ////println("ftheta is now + " +ftheta + " , dist is " + dist);
   //if (itheta > 2*s) itheta = 0;

 //line(cx+(r+freqGraph.get(s-1)*scalefactor)*sin(angle),cy+(r+freqGraph.get(s-1)*scalefactor)*cos(angle),cx+(r+freqGraph.get(i+1)*scalefactor)*sin(angle*(i+1)/s),cy+(r+freqGraph.get(i+1)*scalefactor)*cos(angle*(i+1)/s));

  //if (drawThing) {
  //dist+= 1.0*(75.0/(radius+r)-dist);
  //println(dist);
  //ftheta += dist;
  //if (ftheta > 8*s-4) ftheta = 0;
  //  itheta = floor(ftheta);
  //if (itheta >= 8*s-4) itheta = 0;
  ////println("asdf " + );
  //if (!Float.isNaN(freqGraph.get(itheta/4)*scalefactor)) {
  //radius += 0.3*(freqGraph.get(itheta/4)*scalefactor-radius);
  //}
  //stroke(0);
  //fill(255);
  //ellipse(cx+(radius+r)*sin(angle*itheta/(4*s)),cy+(r+radius)*cos(angle*itheta/(4*s)),15,15);
  //}
  stroke(255);
  
  if (drawThing) {
  for (int i = 0; i < sarray.arr.size()-1; i++) {
    line(width-50-i*(width-100.0)/500.0,height-100-sarray.get(i)*scale2,width-50-(i+1)*(width-100)/500,height-100-sarray.get(i+1)*scale2);
  }
  }
  
  if (sarray.arr.size() > 0) { 
  sarray.insert(freqGraph.getSum()*0.02+0.98*sarray.get(0));
  }
  else {sarray.insert(freqGraph.getSum());
  }
 //println(freqGraph.getSum());
  
  fill(0);
  stroke(255);
  ellipse(cx,cy,2*r,2*r);
  freqGraph.updateFreqs();
  

}