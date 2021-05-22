function hex(string){
	var result=0;
 
	// special unicode values
	var ZERO=ord("0");
	var NINE=ord("9");
	var A=ord("A");
	var F=ord("F");
 
	for (var i=1; i<=string_length(string); i++){
	    var c=ord(string_char_at(string_upper(string), i));
	    result=result<<4;
	    // if the character is a number or letter, add the value
	    // it represents to the total
	    if (c>=ZERO&&c<=NINE){
	        result=result+(c-ZERO);
	    } else if (c>=A&&c<=F){
	        result=result+(c-A+10);
	    }
	}
 
	return result;
}