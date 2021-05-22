alarm[0] = 30;
draw_set_font(fnt_main); 

dialogue_modifier = "";

save_filepath = game_save_id + "save.ini";

collate = false;
delete_files = true;

bleach_color = c_white;
if(file_exists(save_filepath)){
	ini_open(save_filepath);
	bleach_color = ini_read_real("main","lastcolor",c_white);
	collate = ini_read_real("main","collate",false);
	delete_files = ini_read_real("main","deletefiles",true);
	ini_close();
}

color_array_index = -1;
color_array = [c_white,c_red,c_yellow,c_green,c_blue,c_black,c_purple,c_navy,c_lime];
for(var i = 0; i < array_length(color_array); i ++){
	if(color_array[i] = bleach_color){
		color_array_index = i;	
	}
}

save_color = function(){
	ini_open(save_filepath);
	ini_write_real("main","lastcolor",bleach_color);
	ini_close();	
}

save_options = function(){
	ini_open(save_filepath);
	ini_write_real("main","deletefiles",delete_files);
	ini_write_real("main","collate",collate);
	ini_close();	
}

index_bleach_color = function(modifier){
	color_array_index += sign(modifier);
	if(color_array_index >= array_length(color_array)){
		color_array_index = 0;	
	}
	if(color_array_index < 0){
		color_array_index = array_length(color_array)-1;
	}
	bleach_color = color_array[color_array_index];
	save_color();
}

color_uniform = shader_get_uniform(shd_whiteout,"bleach_color");