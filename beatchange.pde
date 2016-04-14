boolean beatChange(boolean lines){
  
  
  
  
  
    if (change && freqGraph.data[beatfreq] < beatlimiter ){
      change = !change;
    } 
    
    if (!change && freqGraph.data[beatfreq] > beatlimiter ){
      change = !change;
    } 
  
  lines = !lines;
  return lines;
}