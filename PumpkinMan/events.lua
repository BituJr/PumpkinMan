function checkEvent()
     --first check to see if we are already in an event, we only want 1 event going on at a time
     if(eventRun > 0) then
          
          eventRun = eventRun - 1
          if(eventRun == 0) then
               inEvent = 0
          end
     end
     
     if(inEvent > 0 and eventRun > 0) then
        
     else
          
          check = math.random(100)
 
         
          if(check > 80 and check < 99) then  
               inEvent = math.random(10)
               eventRun = 1
          end
     end
    
     if(inEvent > 0) then
          runEvent()
     end
end

function runEvent()
     if(inEvent < 6) then
          groundLevel = groundLevel + 40
     end
     if(inEvent > 5 and inEvent < 11) then
          groundLevel = groundLevel - 40
     end
     if(groundLevel < groundMax) then
          groundLevel = groundMax
     end
     if(groundLevel > groundMin) then
          groundLevel = groundMin
     end
end