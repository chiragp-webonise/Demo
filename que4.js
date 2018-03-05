var s1,s2,s3;
function insert() {

            var name = document.getElementById("Text1").value;
            var email = document.getElementById("Text2").value;
	    var timeStamp = Math.floor(Date.now() / 1000);
	    users={};
	    usersDetails=[];            
	    var reg1 = new RegExp('^[a-z0-9]+$');
    
		if(reg1.test(name) && /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test((email)) )
		{	    
	 
			// Check browser support
			if (typeof(Storage) !== "undefined") {
    			// Store
    				
				users.names=name;
				users.emails=email;
				users.timeStamps=timeStamp;
				usersDetails.push(users);

				if(sessionStorage.users === undefined){
					usersDetails.push(users);
					sessionStorage.users = JSON.stringify(usersDetails);
				}else{
					var usersDetails = JSON.parse(sessionStorage.users);
					usersDetails.push(users);
					sessionStorage.users = JSON.stringify(usersDetails);
				}

				document.getElementById("p1").innerHTML = "Record inserted";    			}
    			 else {
   			 document.getElementById("p1").innerHTML = "Sorry, your browser does not support Web Storage...";
			}
		}
		else
		{
			document.getElementById("p1").innerHTML = "Enter correct name and email...";
		}
        }
function show() {
		 
			
			var usersDetails = JSON.parse(sessionStorage.users);	
			var columnCount = usersDetails.length;
			
			
			    //Create a HTML Table element.
			    var table = document.createElement("TABLE");
		            table.border = "1";
			//Add the header row.
			    var row = table.insertRow(-1);

				var headerCell = document.createElement("TH");
				headerCell.innerHTML ="NAME";
				row.appendChild(headerCell);
				var headerCell = document.createElement("TH");
				headerCell.innerHTML ="EMAILS";
				row.appendChild(headerCell);
				var headerCell = document.createElement("TH");
				headerCell.innerHTML ="TIMESTAMPS";
				row.appendChild(headerCell);
			   
				    //Add the data rows.
					for (var k=0; k< 3; k++) {
						var userRecord=usersDetails[k];
						//var columnCount =userRecord[0].length;
					    
						    var cell = row.insertCell(-1);
						    cell.innerHTML = userRecord.names;
					            var cell1 = row.insertCell(-1);
						    cell1.innerHTML = userRecord.emails;
						    var cell2 = row.insertCell(-1);
						    cell2.innerHTML = userRecord.timeStamps+"</br>";			
						
					}
					
 			
			var dvTable = document.getElementById("table");
    			dvTable.innerHTML = "";
   			 dvTable.appendChild(table);
			
			
		}
