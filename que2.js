  function add_number() {

            var first_number = parseInt(document.getElementById("Text1").value);
            var second_number = parseInt(document.getElementById("Text2").value);
            var result = first_number + second_number;
	    var reg = new RegExp('^[0-9]+$');
	    hash1=document.getElementById("Text1").value;
            hash2=document.getElementById("Text2").value
		if(reg.test(hash1) && reg.test(hash2) )
		{	    
	            document.getElementById("p1").innerHTML = "the sum is " + result;
		}
		else if(hash1.length<1 && hash2.length<1)
		{
			document.getElementById("p1").innerHTML = "Please enter any number";
		}		
		else
		{
			document.getElementById("p1").innerHTML = "Wrong input";
		}
        }
		 function sub_number() {

            var first_number = parseInt(document.getElementById("Text1").value);
            var second_number = parseInt(document.getElementById("Text2").value);
            var result = first_number-second_number;
	    var reg = new RegExp('^[0-9]+$');
	    hash1=document.getElementById("Text1").value;
            hash2=document.getElementById("Text2").value
		if(reg.test(hash1) && reg.test(hash2) )
		{	    
	             document.getElementById("p1").innerHTML = "the difference is " + result;
		}
		else if(hash1.length<1 && hash2.length<1)
		{
			document.getElementById("p1").innerHTML = "Please enter any number";
		}		
		else
		{
			document.getElementById("p1").innerHTML = "Wrong input";
		}

           
        }
