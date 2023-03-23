/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
var gui_mouse_x = device_mouse_x_to_gui(0);
var gui_mouse_y = device_mouse_y_to_gui(0);
var max_elements = ds_list_size(buildmode_items_list)+1;
if(gui_mouse_y >= 720 && gui_mouse_y <= 768 && gui_mouse_x >=0 && gui_mouse_x <= 48*max_elements){
	
	for(var i=0;i<ds_list_size(buildmode_items_list);i++){
		var building = ds_list_find_value(buildmode_items_list, i);
		if(gui_mouse_y >= 720 && gui_mouse_y <= 768 && gui_mouse_x >=i*48 && gui_mouse_x <= 48*(i+1)){
			buildmode_object = building;
		}
	}
	
	if(gui_mouse_y >= 720 && gui_mouse_y <= 768 && gui_mouse_x >= 48*(max_elements-1) && gui_mouse_x <= 48*max_elements){
		var tag_id = ds_list_find_index(buildings_tags,buildmode_items_tag) +1;
		if(tag_id == ds_list_size(buildings_tags)){
			tag_id = 0;
		}
		buildmode_items_tag = ds_list_find_value(buildings_tags,tag_id);
		
		buildmode_items_list = findBuildingsWithTag(buildings_list,buildmode_items_tag);
	}
	
}else{
	if(buildmode_mode == 0){
		if(buildmode_object != undefined){
			var cost = buildmode_object[? "COST"];
			var object = asset_get_index(buildmode_object[? "OBJECT"]);
			var instance_x = floor(mouse_x/64)*64 + 32;
			var instance_y = floor(mouse_y/64)*64 + 32;
			var can_build = instance_position(instance_x,instance_y,obj_buildingobject) == noone ? true : false;
	
			if(user_money >= cost && can_build){
			
				var instance = instance_create_layer(instance_x,instance_y,"Instances",object);
		
				instance.direction = buildmode_direction;
				instance.image_angle = buildmode_direction;
		
				with(instance){
					event_user(0);
				}
		
				user_money -=  cost;
				
				if(hasBuildingTag(buildmode_object, "PATHBLOCKING")){
					mp_grid_destroy(collision_grid);
					collision_grid = mp_grid_create(0,0,room_width/64,room_height/64,64,64);
					mp_grid_add_instances(collision_grid,obj_buildingobject,0);
				}
				
				if(hasBuildingTag(buildmode_object, "SHELVE")){
					available_products = getAvailableProducts(available_products);
				}
				
			}
		}
	}
}