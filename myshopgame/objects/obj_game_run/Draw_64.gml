/// @description Rysowanie interfejsu

var max_width = display_get_gui_width();
var max_height = display_get_gui_height();

//RYSOWANIE POŁOZENIA BLOCZKU
if(buildmode_object != undefined){
	var object = asset_get_index(buildmode_object[? "OBJECT"]);
	draw_sprite_ext(object_get_sprite(object),0,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32,1,1,buildmode_direction,c_white,0.2);
	
	/*var interaction_positions = buildmode_object[? "INTERACTION_POSITIONS"];
	
	var top_arrow_data = interaction_positions[? "TOP"];
	var left_arrow_data = interaction_positions[? "TOP"];
	var bottom_arrow_data = interaction_positions[? "TOP"];
	var right_arrow_data = interaction_positions[? "TOP"];
	
	var top_arrow = -1;
	var left_arrow = -1;
	var bottom_arrow = -1;
	var right_arrow = -1;
	if(buildmode_direction == 0){
		top_arrow = top_arrow_data == "ALL" ? 0 : (top_arrow_data == "CUSTOMER" ? 1 : (top_arrow_data == "WORKER" ? 2 : -1));
		left_arrow = left_arrow_data == "ALL" ? 0 : (left_arrow_data == "CUSTOMER" ? 1 : (left_arrow_data == "WORKER" ? 2 : -1));
		bottom_arrow = bottom_arrow_data == "ALL" ? 0 : (bottom_arrow_data == "CUSTOMER" ? 1 : (bottom_arrow_data == "WORKER" ? 2 : -1));
		right_arrow = right_arrow_data == "ALL" ? 0 : (right_arrow_data == "CUSTOMER" ? 1 : (right_arrow_data == "WORKER" ? 2 : -1))
	}else if(buildmode_direction == 90){
		right_arrow = top_arrow_data == "ALL" ? 0 : (top_arrow_data == "CUSTOMER" ? 1 : (top_arrow_data == "WORKER" ? 2 : -1));
		top_arrow = left_arrow_data == "ALL" ? 0 : (left_arrow_data == "CUSTOMER" ? 1 : (left_arrow_data == "WORKER" ? 2 : -1));
		left_arrow = bottom_arrow_data == "ALL" ? 0 : (bottom_arrow_data == "CUSTOMER" ? 1 : (bottom_arrow_data == "WORKER" ? 2 : -1));
		bottom_arrow = right_arrow_data == "ALL" ? 0 : (right_arrow_data == "CUSTOMER" ? 1 : (right_arrow_data == "WORKER" ? 2 : -1))
	}else if(buildmode_direction == 180){
		bottom_arrow = top_arrow_data == "ALL" ? 0 : (top_arrow_data == "CUSTOMER" ? 1 : (top_arrow_data == "WORKER" ? 2 : -1));
		right_arrow = left_arrow_data == "ALL" ? 0 : (left_arrow_data == "CUSTOMER" ? 1 : (left_arrow_data == "WORKER" ? 2 : -1));
		top_arrow = bottom_arrow_data == "ALL" ? 0 : (bottom_arrow_data == "CUSTOMER" ? 1 : (bottom_arrow_data == "WORKER" ? 2 : -1));
		left_arrow = right_arrow_data == "ALL" ? 0 : (right_arrow_data == "CUSTOMER" ? 1 : (right_arrow_data == "WORKER" ? 2 : -1))
	}else if(buildmode_direction == 270){
		left_arrow = top_arrow_data == "ALL" ? 0 : (top_arrow_data == "CUSTOMER" ? 1 : (top_arrow_data == "WORKER" ? 2 : -1));
		bottom_arrow = left_arrow_data == "ALL" ? 0 : (left_arrow_data == "CUSTOMER" ? 1 : (left_arrow_data == "WORKER" ? 2 : -1));
		right_arrow = bottom_arrow_data == "ALL" ? 0 : (bottom_arrow_data == "CUSTOMER" ? 1 : (bottom_arrow_data == "WORKER" ? 2 : -1));
		top_arrow = right_arrow_data == "ALL" ? 0 : (right_arrow_data == "CUSTOMER" ? 1 : (right_arrow_data == "WORKER" ? 2 : -1))
	}
	if(top_arrow != -1){
		draw_sprite_ext(spr_arrow,top_arrow,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32-64,1,1,0,c_white,0.2);
	}
	if(left_arrow != -1){
		draw_sprite_ext(spr_arrow,left_arrow,view_xport[0] + floor(mouse_x/64)*64+32-64,view_yport[0] +floor(mouse_y/64)*64+32,1,1,90,c_white,0.2);
	}
	if(bottom_arrow != -1){
		draw_sprite_ext(spr_arrow,bottom_arrow,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32+64,1,1,180,c_white,0.2);
	}
	if(right_arrow != -1){
		draw_sprite_ext(spr_arrow,right_arrow,view_xport[0] + floor(mouse_x/64)*64+32+64,view_yport[0] +floor(mouse_y/64)*64+32,1,1,270,c_white,0.2);
	}*/
	
	
	
	
}



/*if(buildmode_object == obj_selfcashregister || buildmode_object == obj_bookshelf || buildmode_object == obj_freezer || buildmode_object == obj_musicshelf || buildmode_object == obj_newspapershelf || buildmode_object == obj_productshelf || buildmode_object == obj_shoesshelf || buildmode_object == obj_atmmachine){
	if(buildmode_direction == 0){
		draw_sprite_ext(spr_arrow,0,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32-64,1,1,buildmode_direction,c_white,0.2);
	}else if(buildmode_direction == 90){
		draw_sprite_ext(spr_arrow,0,view_xport[0] + floor(mouse_x/64)*64+32-64,view_yport[0] +floor(mouse_y/64)*64+32,1,1,buildmode_direction,c_white,0.2);
	}else if(buildmode_direction == 180){
		draw_sprite_ext(spr_arrow,0,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32+64,1,1,buildmode_direction,c_white,0.2);
	}else if(buildmode_direction == 270){
		draw_sprite_ext(spr_arrow,0,view_xport[0] + floor(mouse_x/64)*64+32+64,view_yport[0] +floor(mouse_y/64)*64+32,1,1,buildmode_direction,c_white,0.2);
	}
}else if(buildmode_object == obj_workercashregister){
	if(buildmode_direction == 0){
		draw_sprite_ext(spr_arrow,1,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32-64,1,1,0,c_white,0.2);
		draw_sprite_ext(spr_arrow,2,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32+64,1,1,180,c_white,0.2);
	}else if(buildmode_direction == 90){
		draw_sprite_ext(spr_arrow,1,view_xport[0] + floor(mouse_x/64)*64+32-64,view_yport[0] +floor(mouse_y/64)*64+32,1,1,90,c_white,0.2);
		draw_sprite_ext(spr_arrow,2,view_xport[0] + floor(mouse_x/64)*64+32+64,view_yport[0] +floor(mouse_y/64)*64+32,1,1,270,c_white,0.2);
	}else if(buildmode_direction == 180){
		draw_sprite_ext(spr_arrow,1,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32+64,1,1,180,c_white,0.2);
		draw_sprite_ext(spr_arrow,2,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32-64,1,1,0,c_white,0.2);
	}else if(buildmode_direction == 270){
		draw_sprite_ext(spr_arrow,1,view_xport[0] + floor(mouse_x/64)*64+32+64,view_yport[0] +floor(mouse_y/64)*64+32,1,1,270,c_white,0.2);
		draw_sprite_ext(spr_arrow,2,view_xport[0] + floor(mouse_x/64)*64+32-64,view_yport[0] +floor(mouse_y/64)*64+32,1,1,90,c_white,0.2);
	}
}else if(buildmode_object == obj_vegtablestand  || buildmode_object == obj_plushiesbox){
	draw_sprite_ext(spr_arrow,0,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32-64,1,1,0,c_white,0.2);
	draw_sprite_ext(spr_arrow,0,view_xport[0] + floor(mouse_x/64)*64+32-64,view_yport[0] +floor(mouse_y/64)*64+32,1,1,90,c_white,0.2);
	draw_sprite_ext(spr_arrow,0,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32+64,1,1,180,c_white,0.2);
	draw_sprite_ext(spr_arrow,0,view_xport[0] + floor(mouse_x/64)*64+32+64,view_yport[0] +floor(mouse_y/64)*64+32,1,1,270,c_white,0.2);
}*/

//RYSOWANIE PANELU GŁÓWNEGO
draw_set_color(c_white);
draw_rectangle(0,max_height-32,max_width,max_height,false);

var total_left_width = 0;

var button_text = string(user_money) + "$";
var button_text_width = string_width(button_text);
draw_set_color(c_green);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text(total_left_width + 60,max_height-16,button_text);
total_left_width += 120;

draw_set_color(c_gray);
draw_line(total_left_width,max_height-32,total_left_width,max_height);

if(ui_tabs_selected == "OBJECTS"){
	draw_set_color(c_aqua);
	draw_rectangle(total_left_width,max_height-32,total_left_width+120,max_height,false);
	draw_set_color(c_black);
}

var button_text = "Obiekty";
var button_text_width = string_width(button_text);
draw_set_color(c_black);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text(total_left_width + 60,max_height-16,button_text);
total_left_width += 120;

draw_set_color(c_gray);
draw_line(total_left_width,max_height-32,total_left_width,max_height);

//RYSOWANIE
if(ui_tabs_selected == "OBJECTS"){
	draw_set_color(c_ltgrey);
	draw_rectangle(0,max_height-150-32,max_width,max_height-32,false);
	draw_set_color(c_black);
	draw_line(50,max_height-150-32,50,max_height-32);
	
	for(var i=0;i<ds_list_size(buildmode_items_list);i++){
		var building = ds_list_find_value(buildmode_items_list, i);
		var cost = building[? "COST"];
		var object = asset_get_index(building[? "OBJECT"]);
		var sprite = object_get_sprite(object);
		draw_sprite_ext(sprite,0,55 + (70*i) + 32,max_height-150 + 5,1,1,0,c_white,1);
		draw_set_halign(fa_right);
		draw_set_valign(fa_right);
		draw_set_color(c_gray);
		draw_set_alpha(0.8);
		var box_text = string(cost)+"$";
		var box_width = string_width(box_text);
		var box_height = string_height(box_text);
		draw_rectangle(55 + (70*i) + 64-box_width,max_height-150 + 32 + 5-box_height,55 + (70*i) + 64,max_height-150 + 32 + 5,false);
		draw_set_alpha(1);
		draw_set_color(c_black);
		draw_text(55 + (70*i) + 64,max_height-150 + 32 + 5,box_text);
		draw_set_halign(fa_left);
		draw_set_valign(fa_left);
	}
}


//RYSOWANIE WYBORU OBIEKTÓW
/*draw_set_color(c_red);
draw_set_halign(fa_center);


draw_sprite_ext(spr_more,0,(48*ds_list_size(buildmode_items_list))+24,768-24,0.75,0.75,0,c_white,1);
*/

draw_set_color(c_white);
draw_set_halign(fa_left);