/// @description Rysowanie interfejsu

var max_width = display_get_gui_width();
var max_height = display_get_gui_height();

//RYSOWANIE POŁOZENIA BLOCZKU
if(buildmode_object != undefined){
	var object = asset_get_index(buildmode_object[? "OBJECT"]);
	draw_sprite_ext(object_get_sprite(object),0,floor(mouse_x/64)*64+32 - camera_get_view_x(view_camera[0]),floor(mouse_y/64)*64+32 - camera_get_view_y(view_camera[0]),1,1,buildmode_direction,c_white,0.2);
	
	var interaction_positions = buildmode_object[? "INTERACTION_POSITIONS"];
	
	var top_arrow_data = interaction_positions[? "TOP"];
	var left_arrow_data = interaction_positions[? "LEFT"];
	var bottom_arrow_data = interaction_positions[? "BOTTOM"];
	var right_arrow_data = interaction_positions[? "RIGHT"];
	
	var top_arrow = -1;
	var left_arrow = -1;
	var bottom_arrow = -1;
	var right_arrow = -1;
	if(buildmode_direction == 0){
		top_arrow = top_arrow_data == "ALL" ? 0 : (top_arrow_data == "CUSTOMER" ? 1 : (top_arrow_data == "WORKER" ? 2 : -1));
		left_arrow = left_arrow_data == "ALL" ? 0 : (left_arrow_data == "CUSTOMER" ? 1 : (left_arrow_data == "WORKER" ? 2 : -1));
		bottom_arrow = bottom_arrow_data == "ALL" ? 0 : (bottom_arrow_data == "CUSTOMER" ? 1 : (bottom_arrow_data == "WORKER" ? 2 : -1));
		right_arrow = right_arrow_data == "ALL" ? 0 : (right_arrow_data == "CUSTOMER" ? 1 : (right_arrow_data == "WORKER" ? 2 : -1))
	}else if(buildmode_direction == 270){
		right_arrow = top_arrow_data == "ALL" ? 0 : (top_arrow_data == "CUSTOMER" ? 1 : (top_arrow_data == "WORKER" ? 2 : -1));
		top_arrow = left_arrow_data == "ALL" ? 0 : (left_arrow_data == "CUSTOMER" ? 1 : (left_arrow_data == "WORKER" ? 2 : -1));
		left_arrow = bottom_arrow_data == "ALL" ? 0 : (bottom_arrow_data == "CUSTOMER" ? 1 : (bottom_arrow_data == "WORKER" ? 2 : -1));
		bottom_arrow = right_arrow_data == "ALL" ? 0 : (right_arrow_data == "CUSTOMER" ? 1 : (right_arrow_data == "WORKER" ? 2 : -1))
	}else if(buildmode_direction == 180){
		bottom_arrow = top_arrow_data == "ALL" ? 0 : (top_arrow_data == "CUSTOMER" ? 1 : (top_arrow_data == "WORKER" ? 2 : -1));
		right_arrow = left_arrow_data == "ALL" ? 0 : (left_arrow_data == "CUSTOMER" ? 1 : (left_arrow_data == "WORKER" ? 2 : -1));
		top_arrow = bottom_arrow_data == "ALL" ? 0 : (bottom_arrow_data == "CUSTOMER" ? 1 : (bottom_arrow_data == "WORKER" ? 2 : -1));
		left_arrow = right_arrow_data == "ALL" ? 0 : (right_arrow_data == "CUSTOMER" ? 1 : (right_arrow_data == "WORKER" ? 2 : -1))
	}else if(buildmode_direction == 90){
		left_arrow = top_arrow_data == "ALL" ? 0 : (top_arrow_data == "CUSTOMER" ? 1 : (top_arrow_data == "WORKER" ? 2 : -1));
		bottom_arrow = left_arrow_data == "ALL" ? 0 : (left_arrow_data == "CUSTOMER" ? 1 : (left_arrow_data == "WORKER" ? 2 : -1));
		right_arrow = bottom_arrow_data == "ALL" ? 0 : (bottom_arrow_data == "CUSTOMER" ? 1 : (bottom_arrow_data == "WORKER" ? 2 : -1));
		top_arrow = right_arrow_data == "ALL" ? 0 : (right_arrow_data == "CUSTOMER" ? 1 : (right_arrow_data == "WORKER" ? 2 : -1))
	}
	if(top_arrow != -1){
		draw_sprite_ext(spr_arrow,top_arrow,view_xport[0] + floor(mouse_x/64)*64+32- camera_get_view_x(view_camera[0]),view_yport[0] +floor(mouse_y/64)*64+32-64- camera_get_view_y(view_camera[0]),1,1,0,c_white,0.2);
	}
	if(left_arrow != -1){
		draw_sprite_ext(spr_arrow,left_arrow,view_xport[0] + floor(mouse_x/64)*64+32-64- camera_get_view_x(view_camera[0]),view_yport[0] +floor(mouse_y/64)*64+32- camera_get_view_y(view_camera[0]),1,1,90,c_white,0.2);
	}
	if(bottom_arrow != -1){
		draw_sprite_ext(spr_arrow,bottom_arrow,view_xport[0] + floor(mouse_x/64)*64+32- camera_get_view_x(view_camera[0]),view_yport[0] +floor(mouse_y/64)*64+32+64- camera_get_view_y(view_camera[0]),1,1,180,c_white,0.2);
	}
	if(right_arrow != -1){
		draw_sprite_ext(spr_arrow,right_arrow,view_xport[0] + floor(mouse_x/64)*64+32+64- camera_get_view_x(view_camera[0]),view_yport[0] +floor(mouse_y/64)*64+32- camera_get_view_y(view_camera[0]),1,1,270,c_white,0.2);
	}
	
	
	
	
}

//RYSOWANIE PANELU GŁÓWNEGO
draw_set_color(c_white);
draw_rectangle(0,max_height-32,max_width,max_height,false);

var total_left_width = 0;

if(ui_tabs_selected == "MONEY"){
	draw_set_color(c_aqua);
	draw_rectangle(total_left_width,max_height-32,total_left_width+120,max_height,false);
	draw_set_color(c_black);
}

var button_text = string(user_money) + "$";
var button_text_width = string_width(button_text);
if(user_money >= 0){
	draw_set_color(c_green);
}else{
	draw_set_color(c_red);
}
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

if(ui_tabs_selected == "WORKERS"){
	draw_set_color(c_aqua);
	draw_rectangle(total_left_width,max_height-32,total_left_width+120,max_height,false);
	draw_set_color(c_black);
}

var button_text = "Pracownicy";
var button_text_width = string_width(button_text);
draw_set_color(c_black);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text(total_left_width + 60,max_height-16,button_text);
total_left_width += 120;

draw_set_color(c_gray);
draw_line(total_left_width,max_height-32,total_left_width,max_height);

if(ui_tabs_selected == "QUESTS"){
	draw_set_color(c_aqua);
	draw_rectangle(total_left_width,max_height-32,total_left_width+120,max_height,false);
	draw_set_color(c_black);
}

var button_text = "Zadania";
var button_text_width = string_width(button_text);
draw_set_color(c_black);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text(total_left_width + 60,max_height-16,button_text);
total_left_width += 120;

draw_set_color(c_gray);
draw_line(total_left_width,max_height-32,total_left_width,max_height);

//RIGHT SIDE OF PANEL
var total_right_width = 0;
var button_text = "P";
var button_text_width = string_width(button_text);
draw_set_color(c_black);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text(max_width - total_right_width - 15,max_height-16,button_text);
total_right_width += 30;

draw_set_color(c_gray);
draw_line(max_width-total_right_width,max_height-32,max_width-total_right_width,max_height);

var button_text = "S";
var button_text_width = string_width(button_text);
draw_set_color(c_black);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text(max_width - total_right_width - 15,max_height-16,button_text);
total_right_width += 30;

draw_set_color(c_gray);
draw_line(max_width-total_right_width,max_height-32,max_width-total_right_width,max_height);


var button_text = "MS";
var button_text_width = string_width(button_text);
draw_set_color(c_black);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text(max_width - total_right_width - 15,max_height-16,button_text);
total_right_width += 30;

draw_set_color(c_gray);
draw_line(max_width-total_right_width,max_height-32,max_width-total_right_width,max_height);


var button_text = "R";
var button_text_width = string_width(button_text);
draw_set_color(c_black);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text(max_width - total_right_width - 15,max_height-16,button_text);
total_right_width += 30;

draw_set_color(c_gray);
draw_line(max_width-total_right_width,max_height-32,max_width-total_right_width,max_height);


var hour = floor(time_hour/60);
var minute = time_hour%60;

var button_text = "Dzien "+string(time_day)+" "+(hour<10?"0":"")+string(hour)+":"+(minute<10?"0":"")+string(minute);
var button_text_width = string_width(button_text);
draw_set_color(c_black);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text(max_width - total_right_width - 80,max_height-16,button_text);
total_right_width += 160;

draw_set_color(c_gray);
draw_line(max_width-total_right_width,max_height-32,max_width-total_right_width,max_height);

//RYSOWANIE
if(ui_tabs_selected == "MONEY"){
	var tab_start_y = max_height-500-32;
	var tab_end_y = max_height-32;
	
	var tab_start_x = 0;
	var tab_end_x = 600;
	
	draw_set_color(c_ltgrey);
	draw_rectangle(tab_start_x,tab_start_y,tab_end_x,tab_end_y,false);
	
}else if(ui_tabs_selected == "OBJECTS"){
	
	var tab_start_y = max_height-150-32;
	
	
	draw_set_color(c_ltgrey);
	draw_rectangle(0,max_height-150-32,max_width,max_height-32,false);
	
	if(buildmode_items_tag == "ALL"){
		draw_set_color(c_olive);
	}else{
		draw_set_color(c_white);	
	}
	draw_rectangle(7,tab_start_y + 1,42,tab_start_y+36,false);
	
	if(buildmode_items_tag == "DECORATION"){
		draw_set_color(c_olive);
	}else{
		draw_set_color(c_white);	
	}
	draw_rectangle(7,tab_start_y + 1 + 37,42,tab_start_y+36+ 37*1,false);
	
	if(buildmode_items_tag == "INTERACTABLE"){
		draw_set_color(c_olive);
	}else{
		draw_set_color(c_white);	
	}
	draw_rectangle(7,tab_start_y + 1 + 37*2,42,tab_start_y+36+ 37*2,false);
	
	if(buildmode_items_tag == "SPECIAL"){
		draw_set_color(c_olive);
	}else{
		draw_set_color(c_white);	
	}
	draw_rectangle(7,tab_start_y + 1 + 37*3,42,tab_start_y+36+ 37*3,false);

	
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
}else if(ui_tabs_selected == "WORKERS"){
	var tab_start_y = max_height-500-32;
	var tab_end_y = max_height-32;
	
	var tab_start_x = 0;
	var tab_end_x = 600;
	
	draw_set_color(c_ltgrey);
	draw_rectangle(tab_start_x,tab_start_y,tab_end_x,tab_end_y,false);
	
	for(var i=0;i<instance_number(obj_worker);i++){
		var worker = instance_find(obj_worker,i);
		draw_set_halign(fa_left);
		draw_set_valign(fa_left);
		draw_set_color(c_black)
		draw_text(tab_start_x+5,tab_start_y+5+50*i,worker.worker_name);
		draw_text(tab_start_x+5,tab_start_y+5+16+50*i, "CR: "+ string(worker.skill_cashregister) + ",PS: " + string(worker.skill_productstacking)+",RP: " + string(worker.skill_repairing));
		
		var worker_action_as_text = "Czeka na zadanie...";
		if(worker.worker_state == 1){
			worker_action_as_text = "Odnawia produkty na polce"
		}else if(worker.worker_state == 2){
			worker_action_as_text = "Naprawia kase samoobslugowa"	
		}else if(worker.worker_state == 3){
			worker_action_as_text = "Obsluguje kase sklepowa"	
		}else if(worker.worker_state == 4){
			worker_action_as_text = "Naprawia bankomat"	
		}
		draw_text_ext(tab_start_x+200,tab_start_y+5+50*i,worker_action_as_text,16,200);
		
		draw_set_color(c_red);
		draw_rectangle(tab_end_x-5-30*0-25,tab_start_y+5+50*i,tab_end_x-5-30*0,tab_start_y+30+50*i,false);
		
		if(worker.worker_ai_repairing){
			draw_set_color(c_aqua);
		}else{
			draw_set_color(c_white);	
		}
		
		draw_rectangle(tab_end_x-5-30*1-25,tab_start_y+5+50*i,tab_end_x-5-30*1,tab_start_y+30+50*i,false);
		
		if(worker.worker_ai_productstacking){
			draw_set_color(c_aqua);
		}else{
			draw_set_color(c_white);	
		}
		draw_rectangle(tab_end_x-5-30*2-25,tab_start_y+5+50*i,tab_end_x-5-30*2,tab_start_y+30+50*i,false);
		
		if(worker.worker_ai_cashregister){
			draw_set_color(c_aqua);
		}else{
			draw_set_color(c_white);	
		}
		draw_rectangle(tab_end_x-5-30*3-25,tab_start_y+5+50*i,tab_end_x-5-30*3,tab_start_y+30+50*i,false);
	}
	
	draw_set_color(c_white);
	draw_rectangle(tab_start_x+5,tab_end_y-30,tab_end_x-5,tab_end_y-5,false);
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(tab_start_x + ((tab_end_x-tab_start_x)/2),tab_end_y-5-12,"Zatrudnij pracownika (50$)");
	
}

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_left);