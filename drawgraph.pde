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
  

  if (sarray.arr.size() > 0) { 
  sarray.insert(freqGraph.getSum()*0.02+0.98*sarray.get(0));
  //if (sarray.arr.size() > 2) {
  //  if (sarray.get(2) > sarray.get(1) && sarray.get(0) > sarray.get(1) || (sarray.get(2) < sarray.get(1) && sarray.get(0) < sarray.get(1))) {
  //    rotsign *= -1;
  //  }
  //}
  rotsign += 0.07*(15.0*(sarray.get(1)-sarray.get(0))-rotsign);
  }
  else {sarray.insert(freqGraph.getSum());
  }
 //println(freqGraph.getSum());
  pushMatrix();
  fill(0);
  stroke(255);
  ellipse(cx,cy,2*r,2*r);
  
  translate(400,250);
   
   rotate(radians(rot));
  
    if (drawThing) {
      strokeWeight(3);
      line(-cx+width-350,-cy+height-500,-cx+width-450,-cy+height-500);
  for (int i = 0; i < sarray.arr.size()-1; i++) {
    line(-cx+width-350-i*(width-700.0)/500.0,-cy+height-500-sarray.get(i)*scale2,-cx+width-350-(i+1)*(width-700)/500,-cy+height-500-sarray.get(i+1)*scale2);
  }
  }
 
   popMatrix();
  strokeWeight(4);
  freqGraph.updateFreqs();
  if (autorot) rot += rotsign;
  if (keyPressed && keyCode == RIGHT) {
  rot--;
  }if (keyPressed && keyCode == LEFT) {
  rot++;
  }

}