(function() {
  'use strict';
	var Employee=[{name:"arav",age:20,salary:6000,dob:"6 may 1998"},
			 {name:"abhinav",age:19,salary:400,dob:"16 feb 1998"},
			 {name:"anubhav",age:19,salary:3000,dob:"21 june 1999"},
			 {name:"akash",age:10,salary:2000,dob:"26 may 1988"}];
	for(var key in Employee)
		document.write("Name: "+Employee[key].name+" Age: "+Employee[key].age+" Salary: "+Employee[key].salary+" Date of Birth: "+Employee[key].dob+"<br><br>");
	document.write("<hr>");
	document.write("salary more then 5000 <br>");
	for(var key in Employee)
	{if((Employee[key].salary)>5000)
		document.write(Employee[key].name);
	}
	document.write("");
	for(var key in Employee)
	{if((Employee[key].age)>18)
		document.write(Employee[key].name+" is older then 18 <br>");
	}
	document.write("<hr>");
	for(var key in Employee)
	{if((Employee[key].age)<=18)
		document.write(Employee[key].name+" is younger then 18 <br>");
	}
  
  document.write("<hr>");
	for(var key in Employee)
	{if((Employee[key].age)<20 && (Employee[key].salary)<1000 )
  {document.write(Employee[key].name+" is younger then 20 and also salary is less then 1000<br>");
    Employee[key].salary=Employee[key].salary*4;
   document.write("after increment salary will be :"+Employee[key].salary);
  }
	}
}
 ()
); 	 	