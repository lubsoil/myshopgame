/// @description Rysowanie interfejsu

if(debug_info_display){
	draw_set_color(c_black);
	
	draw_text(0,0,"POPULARITY: " + string(shop_popularity));
	draw_text(0,16,"MIN GUESTS: " + string(guests_minimum));
	draw_text(0,32,"MAX GUESTS: " + string(guests_maximum));
	//draw_text(0,48,"FPS: " + string(fps_real));
}

var max_width = display_get_gui_width();
var max_height = display_get_gui_height();

//RYSOWANIE POŁOZENIA BLOCZKU
if(buildmode_object != undefined){
	var object = asset_get_index(buildmode_object[? "OBJECT"]);
	var object_sprite = object_get_sprite(object);
	if(ds_map_find_value(buildmode_object,"ALTERNATIVE_SPRITE") != undefined){
		object_sprite = asset_get_index(buildmode_object[? "ALTERNATIVE_SPRITE"]);
	}
	draw_sprite_ext(object_sprite,0,floor(mouse_x/64)*64+32 - camera_get_view_x(view_camera[0]),floor(mouse_y/64)*64+32 - camera_get_view_y(view_camera[0]),1,1,buildmode_direction,c_white,0.2);
	
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
	
	draw_set_color(c_black);
	
	draw_set_valign(fa_left);
	draw_set_halign(fa_center);
	
	draw_text((120*0)+60,tab_start_y+5,string("Kategoria"))
	draw_text((120*0)+60,tab_start_y+5+25*1,string("Produkty"))
	draw_text((120*0)+60,tab_start_y+5+25*2,string("Pracownicy"))
	draw_text((120*0)+60,tab_start_y+5+25*3,string("Budowanie"))
	draw_text((120*0)+60,tab_start_y+5+25*4,string("Zadania"))
	draw_text((120*0)+60,tab_start_y+5+25*5,string("Inne"))
	draw_text((120*0)+60,tab_start_y+5+25*6,string("Lacznie"))
	
	draw_text((120*1)+60,tab_start_y+5,string("Dzien " + string(time_day)));
	var current_data_set = ds_list_find_value(money_usage_history,ds_list_size(money_usage_history)-1);
	draw_text((120*1)+60,tab_start_y+5+25*1,string(current_data_set[? "PRODUCT"] == undefined ? 0 : current_data_set[? "PRODUCT"])+"$")
	draw_text((120*1)+60,tab_start_y+5+25*2,string(current_data_set[? "WORKER"] == undefined ? 0 : current_data_set[? "WORKER"])+"$")
	draw_text((120*1)+60,tab_start_y+5+25*3,string(current_data_set[? "BUILDMODE"] == undefined ? 0 : current_data_set[? "BUILDMODE"])+"$")
	draw_text((120*1)+60,tab_start_y+5+25*4,string(current_data_set[? "QUEST"] == undefined ? 0 : current_data_set[? "QUEST"])+"$")
	draw_text((120*1)+60,tab_start_y+5+25*5,string(current_data_set[? "OTHER"] == undefined ? 0 : current_data_set[? "OTHER"])+"$")
	draw_text((120*1)+60,tab_start_y+5+25*6,string(current_data_set[? "TOTAL"] == undefined ? 0 : current_data_set[? "TOTAL"])+"$")
	
	if(ds_list_size(money_usage_history)>1){
		draw_text((120*2)+60,tab_start_y+5,string("Dzien " + string(time_day-1)))
		var current_data_set = ds_list_find_value(money_usage_history,ds_list_size(money_usage_history)-2);
		draw_text((120*2)+60,tab_start_y+5+25*1,string(current_data_set[? "PRODUCT"] == undefined ? 0 : current_data_set[? "PRODUCT"])+"$")
		draw_text((120*2)+60,tab_start_y+5+25*2,string(current_data_set[? "WORKER"] == undefined ? 0 : current_data_set[? "WORKER"])+"$")
		draw_text((120*2)+60,tab_start_y+5+25*3,string(current_data_set[? "BUILDMODE"] == undefined ? 0 : current_data_set[? "BUILDMODE"])+"$")
		draw_text((120*2)+60,tab_start_y+5+25*4,string(current_data_set[? "QUEST"] == undefined ? 0 : current_data_set[? "QUEST"])+"$")
		draw_text((120*2)+60,tab_start_y+5+25*5,string(current_data_set[? "OTHER"] == undefined ? 0 : current_data_set[? "OTHER"])+"$")
		draw_text((120*2)+60,tab_start_y+5+25*6,string(current_data_set[? "TOTAL"] == undefined ? 0 : current_data_set[? "TOTAL"])+"$")
	}
	if(ds_list_size(money_usage_history)>2){
		draw_text((120*3)+60,tab_start_y+5,string("Dzien " + string(time_day-2)))
		var current_data_set = ds_list_find_value(money_usage_history,ds_list_size(money_usage_history)-3);
		draw_text((120*3)+60,tab_start_y+5+25*1,string(current_data_set[? "PRODUCT"] == undefined ? 0 : current_data_set[? "PRODUCT"])+"$")
		draw_text((120*3)+60,tab_start_y+5+25*2,string(current_data_set[? "WORKER"] == undefined ? 0 : current_data_set[? "WORKER"])+"$")
		draw_text((120*3)+60,tab_start_y+5+25*3,string(current_data_set[? "BUILDMODE"] == undefined ? 0 : current_data_set[? "BUILDMODE"])+"$")
		draw_text((120*3)+60,tab_start_y+5+25*4,string(current_data_set[? "QUEST"] == undefined ? 0 : current_data_set[? "QUEST"])+"$")
		draw_text((120*3)+60,tab_start_y+5+25*5,string(current_data_set[? "OTHER"] == undefined ? 0 : current_data_set[? "OTHER"])+"$")
		draw_text((120*3)+60,tab_start_y+5+25*6,string(current_data_set[? "TOTAL"] == undefined ? 0 : current_data_set[? "TOTAL"])+"$")
	}
	if(ds_list_size(money_usage_history)>3){
		draw_text((120*4)+60,tab_start_y+5,string("Dzien " + string(time_day-3)))
		var current_data_set = ds_list_find_value(money_usage_history,ds_list_size(money_usage_history)-4);
		draw_text((120*4)+60,tab_start_y+5+25*1,string(current_data_set[? "PRODUCT"] == undefined ? 0 : current_data_set[? "PRODUCT"])+"$")
		draw_text((120*4)+60,tab_start_y+5+25*2,string(current_data_set[? "WORKER"] == undefined ? 0 : current_data_set[? "WORKER"])+"$")
		draw_text((120*4)+60,tab_start_y+5+25*3,string(current_data_set[? "BUILDMODE"] == undefined ? 0 : current_data_set[? "BUILDMODE"])+"$")
		draw_text((120*4)+60,tab_start_y+5+25*4,string(current_data_set[? "QUEST"] == undefined ? 0 : current_data_set[? "QUEST"])+"$")
		draw_text((120*4)+60,tab_start_y+5+25*5,string(current_data_set[? "OTHER"] == undefined ? 0 : current_data_set[? "OTHER"])+"$")
		draw_text((120*4)+60,tab_start_y+5+25*6,string(current_data_set[? "TOTAL"] == undefined ? 0 : current_data_set[? "TOTAL"])+"$")
	}
	
	//MARŻA SPRZEDAŻY
	
	draw_set_valign(fa_left);
	draw_set_halign(fa_left);
	draw_text(tab_start_x+5,tab_end_y-50,"Marza sprzedazy:")
	
	for(var i=0;i<4;i++){
		if(0.75 + i*0.25 == sales_margin){
			draw_set_color(c_purple);
		}else{
			draw_set_color(c_white);
		}
		draw_rectangle(tab_start_x+4+(i*149),tab_end_y-30,tab_start_x+4+(i*149)+145,tab_end_y-5,false);
		draw_set_color(c_black);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text(tab_start_x + 4 + (i*149)+72,tab_end_y-5-12,string(75+i*25)+"%");
	}
	
	
}else if(ui_tabs_selected == "OBJECTS"){
	
	var tab_start_y = max_height-150-32;
	var tab_end_y = max_height-32;
	
	var tab_start_x = 0;
	var tab_end_x = max_width;
	
	
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
	
	var max_items_width = max_width-60;
	var max_items = floor(max_items_width/70);
	
	for(var i=0;i<ds_list_size(buildmode_items_list);i++){
		var x_position = i%max_items;
		var y_position = floor(i/max_items);
		var building = ds_list_find_value(buildmode_items_list, i);
		var cost = building[? "COST"];
		var object = asset_get_index(building[? "OBJECT"]);
		var sprite = object_get_sprite(object);
		
		if(ds_map_find_value(building,"ALTERNATIVE_SPRITE") != undefined){
			sprite = asset_get_index(building[? "ALTERNATIVE_SPRITE"]);
		}
		draw_sprite_ext(sprite,0,55 + (70*x_position) + 32,max_height-150 + 5 + (y_position*70),1,1,0,c_white,1);
		draw_set_halign(fa_right);
		draw_set_valign(fa_right);
		draw_set_color(c_gray);
		draw_set_alpha(0.8);
		var box_text = string(cost)+"$";
		var box_width = string_width(box_text);
		var box_height = string_height(box_text);
		draw_rectangle(55 + (70*x_position) + 64-box_width,max_height-150 + 32 + 5-box_height + (y_position*70),55 + (70*x_position) + 64,max_height-150 + 32 + 5 + (y_position*70),false);
		draw_set_alpha(1);
		draw_set_color(c_black);
		draw_text(55 + (70*x_position) + 64,max_height-150 + 32 + 5 + (y_position*70),box_text);
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
		draw_text(tab_start_x+5,tab_start_y+5+16+50*i, "CR:"+ string(worker.skill_cashregister) + ",PS:" + string(worker.skill_productstacking)+",RP:" + string(worker.skill_repairing) + " "+string(worker.worker_salary)+"$/D");
		
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
	
}else if(ui_tabs_selected == "QUESTS"){
	var tab_start_y = max_height-500-32;
	var tab_end_y = max_height-32;
	
	var tab_start_x = 0;
	var tab_end_x = 600;
	
	draw_set_color(c_ltgrey);
	draw_rectangle(tab_start_x,tab_start_y,tab_end_x,tab_end_y,false);
	
	
	var starting_y_point = tab_start_y + 5;
	for(var i=0;i<ds_list_size(quests_list);i++)
	{
		var current_quests = ds_list_find_value(quests_list,i);
		var current_quests_name = current_quests[? "NAME"];
		var quest_progress = 0;
		
		var current_quests_text = current_quests_name;
		if(current_quests_name == "START_BASICOBJECTS"){
			var current_quests_progress = current_quests[? "PROGRESS"];
			if(current_quests_progress[? "SHELVE"] == true){
				quest_progress++;
			}
			if(current_quests_progress[? "CASHREGISTER"] == true){
				quest_progress++;
			}
			current_quests_text = "Postaw polke oraz kase sklepowa (%PROGRESS%/2)\nNagroda: 25$";
		}else if(current_quests_name == "EARN_MONEY"){
			quest_progress = current_quests[? "PROGRESS"];
			var current_quests_progress_required = current_quests[? "PROGRESS_REQUIRED"];
			current_quests_text = "Zarob %MAXPROGRESS% Pieniedzy (%PROGRESS%/%MAXPROGRESS%)\nNagroda: "+string(round(current_quests_progress_required*0.1))+"$";
			current_quests_text = string_replace_all(current_quests_text,"%MAXPROGRESS%",string(current_quests_progress_required))
		}
		current_quests_text = string_replace(current_quests_text,"%PROGRESS%",string(quest_progress))
		
		draw_set_valign(fa_left);
		draw_set_halign(fa_left);
		draw_set_color(c_black);
		if(current_quests[? "COMPLETED"] == true)
		{
			draw_set_color(c_green);
		}
		
		draw_text_ext(5,starting_y_point,current_quests_text,20,580);
		
		starting_y_point += string_height_ext(current_quests_text,20,580);	
	}
}

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_left);