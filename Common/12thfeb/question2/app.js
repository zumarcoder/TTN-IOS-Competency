(function() {
  'use strict';
	
  var string1 = prompt("Enter the String to check for palindrome");
	var lastindex=string1.length;
	var string2=string1;
	var last=lastindex-1;
	var count=0;
	for(var i=0;i<lastindex;i++)
	{
		if(string1[i]==string2[last-i])
			count++;
	}
	if(lastindex<1)
		alert("Enter anything first");
	else if(count==lastindex)
	alert("String is Palindrome");
	else
	alert("String is not Palindrome");
}
 ()
); 	 	