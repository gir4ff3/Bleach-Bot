var color_string = get_string(dialogue_modifier + "Enter the hex color code (RGB FORMAT)","");
if(color_string = ""){
	exit;
}
color_string = string_replace_all(color_string," ","");
if(string_char_at(color_string,1) = "#"){
	color_string = string_delete(color_string,1,1);
}
if(string_length(color_string) != 6){
	dialogue_modifier = "You entered the color incorrectly. ";
	event_user(2);
	exit;
}

show_debug_message("Hex Color " + color_string + " has been inputted.");

//Converts RGB into BGR (because GMS works in BGR)
var R = string_copy(color_string,1,2);
var G = string_copy(color_string,3,2);
var B = string_copy(color_string,5,2);

color_string = B + G + R;

bleach_color = hex(color_string);