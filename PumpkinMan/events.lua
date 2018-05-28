-- Criando Eventos

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
		  if(check > 72 and check < 81) then
					inEvent = 12
					eventRun = 1
			end
     end
    
     if(inEvent > 0) then
          runEvent()
     end
end

function runEvent()
     if(inEvent < 6) then
          chaoLevel = chaoLevel + 40
     end
     if(inEvent > 5 and inEvent < 11) then
          chaoLevel = chaoLevel - 40
     end
     if(chaoLevel < chaoMax) then
          chaoLevel = chaoMax
     end
     if(chaoLevel > chaoMin) then
          chaoLevel = chaoMin
     end
end
