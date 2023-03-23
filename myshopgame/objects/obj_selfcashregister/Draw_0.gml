/// @description RYSOWANIE
draw_self();

if(obj_game_run.debug_info_display){
	draw_set_color(c_black);
	draw_text(x-32,y-32,string(machine_brokechance) + " " + string(machine_broken));
}