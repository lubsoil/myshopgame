/// @description PERSON DRAWING
draw_sprite_ext(spr_human_top_000,image_index,x,y,image_xscale,image_yscale,0,appearance_top,1);
draw_sprite_ext(spr_human_bottom_000,image_index,x,y,image_xscale,image_yscale,0,appearance_bottom,1);
if(appearance_head == 0){
	draw_sprite_ext(spr_human_head_000,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
}else if(appearance_head == 1){
	draw_sprite_ext(spr_human_head_001,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
}


if(obj_game_run.debug_info_display){
	draw_set_color(c_white);
	draw_text(x-32,y,string(customer_state) + " " + (interaction_time == undefined ? "?" : string(interaction_time)));
	draw_set_color(c_lime);
	draw_text(x-32,y+16,string(ds_list_size(shopping_list)) + " " + string(ds_list_size(cart_list)) +"/"+string(2 + cart_maximum))

	draw_text(x-32,y-32,string(direction));

	draw_set_color(c_yellow);

	draw_path(path,x,y,1);

	draw_set_color(c_white);
}
