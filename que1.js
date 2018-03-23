
function CharCounts() {
	var arr= prompt("Enter your numbers").split(",")
	arr.sort();
	var str=arr.toString();
	var uchars = {};
	var regex = new RegExp(',', 'g');
	str = str.replace(regex, '');
	str.replace(/\S/g, function(l){uchars[l] = (isNaN(uchars[l]) ? 1 : uchars[l] + 1);});

	for(var j in uchars)
	{
		
		document.getElementById("p1").innerHTML = document.getElementById("p1").innerHTML + j+':' + uchars[j]+ "</br>";   
	}
	
}


