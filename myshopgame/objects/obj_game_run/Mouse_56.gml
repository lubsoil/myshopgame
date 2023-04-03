/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
var gui_mouse_x = device_mouse_x_to_gui(0);
var gui_mouse_y = device_mouse_y_to_gui(0);

var max_width = display_get_gui_width();
var max_height = display_get_gui_height();

var action_cancelled = false;

if(gui_mouse_y >= max_height-32 && gui_mouse_y <= max_height && gui_mouse_x >=0 && gui_mouse_x <= max_width){
	action_cancelled = true;
	
	if(gui_mouse_y >= max_height-32 && gui_mouse_y <= max_height && gui_mouse_x >=0 && gui_mouse_x <= 120){
		ui_tabs_selected = ui_tabs_selected == "MONEY" ? undefined : "MONEY";
	}
	if(gui_mouse_y >= max_height-32 && gui_mouse_y <= max_height && gui_mouse_x >=120 && gui_mouse_x <= 240){
		ui_tabs_selected = ui_tabs_selected == "OBJECTS" ? undefined : "OBJECTS";
	}
	if(gui_mouse_y >= max_height-32 && gui_mouse_y <= max_height && gui_mouse_x >=240 && gui_mouse_x <= 360){
		ui_tabs_selected = ui_tabs_selected == "WORKERS" ? undefined : "WORKERS";
	}
	if(gui_mouse_y >= max_height-32 && gui_mouse_y <= max_height && gui_mouse_x >=360 && gui_mouse_x <= 480){
		ui_tabs_selected = ui_tabs_selected == "QUESTS" ? undefined : "QUESTS";
	}
}
if(ui_tabs_selected == "MONEY"){
	
}else if(ui_tabs_selected == "OBJECTS"){
	if(gui_mouse_y >= max_height-32-150 && gui_mouse_y <= max_height-32 && gui_mouse_x >=0 && gui_mouse_x <= max_width){
		action_cancelled = true;
		
		var tab_start_y = max_height-150-32;
		
		if(gui_mouse_y >= tab_start_y+1 && gui_mouse_y <= tab_start_y+36 && gui_mouse_x >= 7 && gui_mouse_x <= 7 + 35){
			buildmode_items_tag = "ALL";
			buildmode_items_list = buildmode_items_tag == "ALL" ? buildings_list : findBuildingsWithTag(buildings_list,buildmode_items_tag);
		}
		
		if(gui_mouse_y >= tab_start_y+1+37*1 && gui_mouse_y <= tab_start_y+36+37*1 && gui_mouse_x >= 7 && gui_mouse_x <= 7 + 35){
			buildmode_items_tag = "DECORATION";
			buildmode_items_list = buildmode_items_tag == "ALL" ? buildings_list : findBuildingsWithTag(buildings_list,buildmode_items_tag);
		}
		
		if(gui_mouse_y >= tab_start_y+1+37*2 && gui_mouse_y <= tab_start_y+36+37*2 && gui_mouse_x >= 7 && gui_mouse_x <= 7 + 35){
			buildmode_items_tag = "INTERACTABLE";
			buildmode_items_list = buildmode_items_tag == "ALL" ? buildings_list : findBuildingsWithTag(buildings_list,buildmode_items_tag);
		}
		
		if(gui_mouse_y >= tab_start_y+1+37*3 && gui_mouse_y <= tab_start_y+36+37*3 && gui_mouse_x >= 7 && gui_mouse_x <= 7 + 35){
			buildmode_items_tag = "SPECIAL";
			buildmode_items_list = buildmode_items_tag == "ALL" ? buildings_list : findBuildingsWithTag(buildings_list,buildmode_items_tag);
		}
		
		var max_items_width = max_width-60;
		var max_items = floor(max_items_width/70);
		
		for(var i=0;i<ds_list_size(buildmode_items_list);i++){
			var building = ds_list_find_value(buildmode_items_list, i);
			var x_position = i%max_items;
			var y_position = floor(i/max_items);
			if(gui_mouse_y >= max_height - 182 + 5 + (70*y_position) && gui_mouse_y <= max_height - 150 + 5 + 64 + (70*y_position) && gui_mouse_x >= 55 + (70*x_position) && gui_mouse_x <= 55 + (70*x_position) + 64){
				buildmode_object = buildmode_object == building ? undefined : building;
			}
		}
	}
}else if(ui_tabs_selected == "WORKERS"){
	var tab_start_y = max_height-500-32;
	var tab_end_y = max_height-32;
	
	var tab_start_x = 0;
	var tab_end_x = 600;
	
	if(gui_mouse_y >= tab_start_y && gui_mouse_y <= tab_end_y && gui_mouse_x >=tab_start_x && gui_mouse_x <= tab_end_x){
		action_cancelled = true;
		
		for(var i=0;i<instance_number(obj_worker) > 0;i++){
			var worker = instance_find(obj_worker,i);
			
			if(gui_mouse_y >= tab_start_y+5+50*i && gui_mouse_y <= tab_start_y+30+50*i  && gui_mouse_x >= tab_end_x-5-30*3-25 && gui_mouse_x <= tab_end_x-5-30*3){
				worker.worker_ai_cashregister = not worker.worker_ai_cashregister
				i=10000;
			}
			
			if(gui_mouse_y >= tab_start_y+5+50*i && gui_mouse_y <= tab_start_y+30+50*i  && gui_mouse_x >= tab_end_x-5-30*2-25 && gui_mouse_x <= tab_end_x-5-30*2){
				worker.worker_ai_productstacking = not worker.worker_ai_productstacking
				i=10000;
			}
			
			if(gui_mouse_y >= tab_start_y+5+50*i && gui_mouse_y <= tab_start_y+30+50*i  && gui_mouse_x >= tab_end_x-5-30*1-25 && gui_mouse_x <= tab_end_x-5-30*1){
				worker.worker_ai_repairing = not worker.worker_ai_repairing
				i=10000;
			}
			
			if(gui_mouse_y >= tab_start_y+5+50*i && gui_mouse_y <= tab_start_y+30+50*i  && gui_mouse_x >= tab_end_x-5-30*0-25 && gui_mouse_x <= tab_end_x-5-30*0){
				with(worker){
					instance_destroy();	
				}
				i=10000;
			}
		}
		
		if(gui_mouse_y >= tab_end_y-30 && gui_mouse_y <= tab_end_y-5 && gui_mouse_x >= tab_start_x + 5 && gui_mouse_x <= tab_end_x - 5){
			if(user_money >= 50 && instance_number(obj_entrance) > 0){
				var entrance = instance_find(obj_entrance,floor(random(instance_number(obj_entrance))));
				instance_create_layer(entrance.x,entrance.y,"Instances",obj_worker);
				user_money -=50;
			}
		}
	}
}


if(!action_cancelled){	
	if(buildmode_mode == 0){
		if(buildmode_object != undefined){
			var cost = buildmode_object[? "COST"];
			var object = asset_get_index(buildmode_object[? "OBJECT"]);
			var instance_x = floor(mouse_x/64)*64 + 32;
			var instance_y = floor(mouse_y/64)*64 + 32;
			var can_build = instance_position(instance_x,instance_y,obj_buildmodeobject) == noone ? true : false;
	
			if(user_money >= cost && can_build){
			
				var instance = instance_create_layer(instance_x,instance_y,"Instances",object);
		
				instance.direction = buildmode_direction;
				instance.image_angle = buildmode_direction;
				
				if(ds_map_find_value(buildmode_object,"CREATE_VARIABLES") != undefined){
					var map = buildmode_object[? "CREATE_VARIABLES"];
					var map_key = ds_map_find_first(map);
					while(map_key != undefined){
						variable_instance_set(instance,map_key,map[? map_key]);
						map_key = ds_map_find_next(map,map_key);	
					}
				}
		
				with(instance){
					event_user(0);
				}
				
				removeMoney(cost,"BUILDMODE");
				
				if(hasBuildingTag(buildmode_object, "PATHBLOCKING")){
					mp_grid_destroy(collision_grid);
					collision_grid = mp_grid_create(0,0,room_width/64,room_height/64,64,64);
					mp_grid_add_instances(collision_grid,obj_buildmodeobject,0);
				}
				
				if(hasBuildingTag(buildmode_object, "SHELVE")){
					available_products = getAvailableProducts(available_products);
				}
				
			}
		}
	}
}