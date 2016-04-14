boolean beatChange(boolean lines){
  
  
  
  boolean change = true;
  
    if (change = true && freqGraph.data[beatfreq] < beatlimiter ){
      change = !change;
    } 
    
    if (change = false && freqGraph.data[beatfreq] > beatlimiter ){
      change = !change;
    } 
  
  lines = !lines;
  return lines;
}