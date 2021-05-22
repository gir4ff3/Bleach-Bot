var g_h = display_get_gui_height();
var g_w = display_get_gui_width();
draw_sprite_ext(spr_render_example,0,150,g_h/2 + 10,2,2,0,c_white,1);

shader_set(shd_whiteout);
shader_set_uniform_f_array(color_uniform,[color_get_red(bleach_color)/255,color_get_green(bleach_color)/255,color_get_blue(bleach_color)/255]);
draw_sprite_ext(spr_render_example,0,475,g_h/2 + 10,2,2,0,c_white,1);
shader_reset();

draw_set_halign(fa_center);

draw_text_transformed(g_w/2 - 20,20,"Bleach Bot",1,1,0);
draw_sprite_ext(spr_bleach_bot,0,g_w - 100,60,10,10,0,c_white,1);

var string1 = "Press space to begin bleaching";
var string2 = "Press the arrow keys to toggle colors, or press \"C\" to add your own color. \n (shift + C) will toggle collation, (shift + D) will toggle file deletion";
draw_text_transformed(room_width/2,g_h-90,string1,0.5,0.5,0);
draw_text_transformed(room_width/2,g_h-50,string2,0.25,0.25,0);
draw_set_halign(fa_left);

draw_sprite_ext(spr_arrow,0,g_w/2 - 10,g_h/2,3,3,0,c_black,1);

draw_set_valign(fa_middle);
var str_collate = "Collating: ";
draw_text_transformed(10,20,str_collate,0.25,0.25,0);
draw_sprite_ext(spr_check_x,collate,10 + (string_width(str_collate) * 0.25) + 10,20 + 1,2,2,0,c_white,1);

var str_delete = "Deleting Files: ";
draw_text_transformed(10,40,str_delete,0.25,0.25,0);
draw_sprite_ext(spr_check_x,delete_files,10 + (string_width(str_delete) * 0.25) + 10,40 + 1,2,2,0,c_white,1);
draw_set_valign(fa_top);