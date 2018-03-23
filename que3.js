var f=false;
                    function start() {

            
		var win1=window.open("www.google.com", '_blank');
		var win2=window.open("www.google.com", '_blank');
		var win3=window.open("www.google.com", '_blank');
		var win4=window.open("www.google.com", '_blank');
		var win5=window.open("www.google.com", '_blank');
		setTimeout(function(){ if(!f){win1.close();}else{return;}}, 1000);
		setTimeout(function(){ if(!f){win2.close();}else{return;}}, 2000);
		setTimeout(function(){ if(!f){win3.close();}else{return;}}, 3000);
		setTimeout(function(){ if(!f){win4.close();}else{return;}}, 4000);
		setTimeout(function(){ if(!f){win5.close();}else{return;}}, 5000); 
		
        }
		 function stop() {
			f=true;
            	
        }
