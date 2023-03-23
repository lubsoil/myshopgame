/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
//RYSOWANIE POŁOZENIA BLOCZKU
if(buildmode_object != undefined){
	var object = asset_get_index(buildmode_object[? "OBJECT"]);
	draw_sprite_ext(object_get_sprite(object),0,view_xport[0] + floor(mouse_x/64)*64+32,view_yport[0] +floor(mouse_y/64)*64+32,1,1,buildmode_direction,c_white,0.2);
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


//RYSOWANIE GOTÓWKI
draw_set_color(c_green);
draw_text(0,0,string(user_money)+"$");
draw_set_color(c_white);
draw_text(0,16,"Popularność: " +string(shop_popularity));
if(debug_info_display){
	draw_text(0,32,string(guests_minimum) + " "+ string(guests_maximum))
}


//RYSOWANIE WYBORU OBIEKTÓW
draw_set_color(c_red);
draw_set_halign(fa_center);

for(var i=0;i<ds_list_size(buildmode_items_list);i++){
	var building = ds_list_find_value(buildmode_items_list, i);
	var cost = building[? "COST"];
	var object = asset_get_index(building[? "OBJECT"]);
	var sprite = object_get_sprite(object);
	draw_sprite_ext(sprite,0,(48*i)+24,768-24,0.75,0.75,0,c_white,1);
	draw_text(48*i+24,768-64,string(cost)+"$");
}
draw_sprite_ext(spr_more,0,(48*ds_list_size(buildmode_items_list))+24,768-24,0.75,0.75,0,c_white,1);

/*
draw_sprite_ext(spr_entrance,0,(48*0)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*0+24,768-64,"0$");
draw_sprite_ext(spr_wall,0,(48*1)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*1+24,768-64,"20$");
draw_sprite_ext(spr_selfcashregister,0,(48*2)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*2+24,768-64,"100$");
draw_sprite_ext(spr_workercashregister,0,(48*3)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*3+24,768-64,"50$");
draw_sprite_ext(spr_productshelf,0,(48*4)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*4+24,768-64,"40$");
draw_sprite_ext(spr_vegetablestand,0,(48*5)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*5+24,768-64,"30$");
draw_sprite_ext(spr_freezer,0,(48*6)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*6+24,768-64,"150$");
draw_sprite_ext(spr_bookshelf,0,(48*7)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*7+24,768-64,"50$");
draw_sprite_ext(spr_newspapershelf,0,(48*8)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*8+24,768-64,"55$");
draw_sprite_ext(spr_musicshelf,0,(48*9)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*9+24,768-64,"50$");
draw_sprite_ext(spr_shoesshelf,0,(48*10)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*10+24,768-64,"40$");
draw_sprite_ext(spr_plushiesbox,0,(48*11)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*11+24,768-64,"40$");
draw_sprite_ext(spr_atmmachine,0,(48*12)+24,768-24,0.75,0.75,0,c_white,1);
draw_text(48*12+24,768-64,"150$");
*/

draw_set_color(c_white);
draw_set_halign(fa_left);