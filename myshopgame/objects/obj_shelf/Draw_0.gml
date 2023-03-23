/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
draw_self();

if(obj_game_run.debug_info_display){
	var loop_item = ds_map_find_first(product_stock);
	var draw_y = -32;
	while(loop_item != undefined){
		draw_set_color(c_black);
		draw_text(x-32,y+draw_y, string(loop_item) + " " + string(product_stock[? loop_item]) );
		draw_y+=16;
		loop_item = ds_map_find_next(product_stock,loop_item);
	}
}
