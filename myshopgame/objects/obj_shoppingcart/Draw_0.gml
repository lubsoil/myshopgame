/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
draw_self();

if(obj_game_run.debug_info_display){
	draw_set_color(c_black);
	draw_text(x-32,y, shoppingcart_type);
	draw_text(x-32,y+16, string(shoppingcart_amount)+"/"+string(shoppingcart_maximum));
}
