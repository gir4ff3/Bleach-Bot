var color_string = get_string(dialogue_modifier + "Enter the rgb color, seperated by commas","");
if(color_string = ""){
	exit;
}
if(string_count(",",color_string) != 2 or !(string_length(string_digits(color_string)) >= 3) or string_last_pos(",",color_string) - string_pos(",",color_string) <= 1){
	dialogue_modifier = "You entered the color incorrectly. ";
	event_user(0);
	exit;
}
	
color_string = string_replace_all(color_string," ","");
	
var rgb = 0;
repeat(3){
	var pos = string_pos(",",color_string);
	if(pos = 0) pos = string_length(color_string)+1;
	rgb[array_length(rgb)] = real(string_copy(color_string,1,pos));
	color_string = string_delete(color_string,1,pos);
}
	
show_debug_message("RGB Color " + string(rgb) + " has been inputted.");
	
bleach_color = make_color_rgb(rgb[0],rgb[1],rgb[2]);