files = 0;
filter = "Sprite Images (*.png *.gif *.jpg *.jpeg)|*.png;*.gif;*.jpg;*.jpeg|Background Images (*.png)|*.png|All Files (*.*)|*.*";

ret = get_open_filenames(filter, "Select Files");

//This means user pressed "cancel"
if(ret = "") exit;

do{
    var next_break = string_pos("\n",ret);
    if(next_break = 0) next_break = string_length(ret);

    var filename = string_copy(ret,1,next_break);
	filename = string_delete(filename,string_pos("\n",filename),2);

    files[array_length(files)] = filename;
    ret = string_delete(ret,1,next_break);
}until(ret = "");

if(!collate){
	for(var i = 0; i < array_length(files); i ++){
		var file_path = game_save_id + filename_name(files[i]);
	    file_copy(files[i], file_path);

	    var spr = sprite_add(file_path,0,false,false,0,0);
	    var sw = sprite_get_width(spr);
	    var sh = sprite_get_height(spr);
	    var surf = surface_create(sw,sh);
    
	    surface_set_target(surf);
		draw_clear_alpha(c_white,0);
		shader_set(shd_whiteout);
		shader_set_uniform_f_array(color_uniform,[color_get_red(bleach_color)/255,color_get_green(bleach_color)/255,color_get_blue(bleach_color)/255]);
	    draw_sprite(spr,0,0,0);
		shader_reset();
	    surface_reset_target();
    
		if(!delete_files){
			var _end = string_copy(files[i],string_length(files[i])-3,4);
			files[i] = string_copy(files[i],0,string_length(files[i])-4);
			files[i] = files[i] + "_bleached" + _end;
		}
		
	    surface_save(surf,files[i]);
    
	    surface_free(surf);
	    sprite_delete(spr);
		
		file_delete(file_path)
		
	}
}else{
	var tot_w = -1;
	var tot_h = 0;
	var sprites = 0;
	
	var name_path = files[0];
	var _end = string_copy(name_path,string_length(name_path)-3,4);
	name_path = string_copy(name_path,0,string_length(name_path)-4);
	name_path = name_path + "_bleached_collate" + _end;
	
	for(var i = 0; i < array_length(files); i ++){
		var file_path = game_save_id + filename_name(files[i]);
	    file_copy(files[i], file_path);
		
		var spr = sprite_add(file_path,0,false,false,0,0);
		var h = sprite_get_height(spr);
		var w = sprite_get_width(spr);
		
		var e = array_length(sprites);
	    sprites[e][0] = spr;
	    sprites[e][1] = h;
		
	    tot_h += h;
		if(tot_w < w) tot_w = w;
		
		file_delete(file_path);
		if(delete_files) file_delete(files[i]);
	}
	
	var cur_h = 0;
	var surf = surface_create(tot_w,tot_h);
	surface_set_target(surf);
	draw_clear_alpha(c_white,0);
	shader_set(shd_whiteout);
	shader_set_uniform_f_array(color_uniform,[color_get_red(bleach_color)/255,color_get_green(bleach_color)/255,color_get_blue(bleach_color)/255]);
	for(var i = 0; i < array_length(sprites); i ++){
		var spr = sprites[i][0];
		draw_sprite(spr,0,0,cur_h);
		cur_h += sprites[i][1];
	}
	shader_reset();
	surface_reset_target();
	surface_save(surf,name_path);
	surface_free(surf);
	
	//If you delete the sprites before the surface, it will draw blanks, so gotta loop through afterward
	for(var i = 0; i < array_length(sprites); i ++){
		sprite_delete(sprites[i][0]);
	}

}

show_message("Finished!");