function insert() {

            var name = document.getElementById("Text1").value;
            var email = document.getElementById("Text2").value;
            
	    var reg1 = new RegExp('^[a-z0-9]+$');
	     //var reg2 = new RegExp('/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/');
    
		if(reg1.test(name) && /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test((email)) )
		{	    
	 
			// Check browser support
			if (typeof(Storage) !== "undefined") {
    			// Store
    				sessionStorage.setItem("name", name);
				sessionStorage.setItem("email", email);
				var timeStamp = Math.floor(Date.now() / 1000);
				sessionStorage.setItem("timestamp",timeStamp);
				/*
				sessionStorage.name=name;
				sessionStorage.email= email;
				var timeStamp = Math.floor(Date.now() / 1000);
				sessionStorage.timestamp=timeStamp;*/
				document.getElementById("p1").innerHTML = "Record inserted";    			}
    			 else {
   			 document.getElementById("p1").innerHTML = "Sorry, your browser does 				not support Web Storage...";
			}
		}
		else
		{
			document.getElementById("p1").innerHTML = "Enter correct name and email...";
		}
        }
		 function show() {
		 
		/*document.getElementById("names").innerHTML = document.getElementById("names").innerHTML + sessionStorage.name;	
		document.getElementById("emails").innerHTML = document.getElementById("emails").innerHTML +sessionStorage.email;     
		document.getElementById("timestamps").innerHTML = document.getElementById("timestamps").innerHTML + sessionStorage.timestamp;		
        */
			for (i = 0; i < sessionStorage.length; i++) {
	
			 document.getElementById("names").innerHTML=document.getElementById("names").innerHTML+sessionStorage.getItem("name");
			 document.getElementById("emails").innerHTML=document.getElementById("emails").innerHTML+sessionStorage.getItem("email");
			 document.getElementById("timestamps").innerHTML=document.getElementById("timestamps").innerHTML+sessionStorage.getItem("timestamp") +"<br>";
			}
			
		}
