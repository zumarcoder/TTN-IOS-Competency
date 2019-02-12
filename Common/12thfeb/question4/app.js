(function() {
  'use strict';
	var obj={ name:"akash",age:19,address:"Ghaziabad"};
	var clone=obj;
	for(var property in obj)
	console.log("Info in obj "+obj[property]);
	for(var property1 in clone)
	console.log("Info in Clone "+clone[property1]);
}
 ()
); 	 	