/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
var obj = instance_position(mouse_x,mouse_y,obj_buildmodeobject);
if(obj == noone){
	obj = instance_position(mouse_x,mouse_y,obj_entrance);
}
if(obj == noone){
	obj = instance_position(mouse_x,mouse_y,obj_decoration_floor);
}
if(obj != noone){
	var temp_instance_1 = instance_position(obj.x-32,obj.y+32,obj_buildmodeobject);
	var temp_instance_2 = instance_position(obj.x+32,obj.y-32,obj_buildmodeobject);
	var temp_instance_3 = instance_position(obj.x+64+32,obj.y+32,obj_buildmodeobject);
	var temp_instance_4 = instance_position(obj.x+32,obj.y+64+32,obj_buildmodeobject);
	
	var building = findBuildingByObject(buildings_list,obj);
	var refund = 0;
	if(building != undefined){
		refund = round(building[? "COST"]*0.2)
	}
	addMoney(refund,"BUILDMODE");
	
	with(obj){
		instance_destroy();	
	}
	
	if(temp_instance_1 != noone){
		with(temp_instance_1){
			event_user(0);	
		}
	}
	
	if(temp_instance_2 != noone){
		with(temp_instance_2){
			event_user(0);	
		}
	}
	
	if(temp_instance_3 != noone){
		with(temp_instance_3){
			event_user(0);	
		}
	}
	
	if(temp_instance_4 != noone){
		with(temp_instance_4){
			event_user(0);	
		}
	}
	
	mp_grid_destroy(collision_grid);
	collision_grid = mp_grid_create(0,0,room_width/64,room_height/64,64,64);
	mp_grid_add_instances(collision_grid,obj_buildmodeobject,0);
	
	available_products = getAvailableProducts(available_products);
}