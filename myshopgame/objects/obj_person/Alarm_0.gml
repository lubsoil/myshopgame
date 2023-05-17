/// @description PATHFINDING
if(!obj_game_run.game_paused){
	if(path_exists(path)){
		path_delete(path);
	}
	path = path_add();

	if(target_type == "OBJECT"){
		if(target_object != noone){
			if(instance_exists(target_object)){
				if(target_object.isLeftFreePosition == string_lower(person_type)  || target_object.isLeftFreePosition == "any"){
					target_x = target_object.x - target_object.offcenter_x - 64;
					target_y = target_object.y - target_object.offcenter_y;
				}else if(target_object.isTopFreePosition == string_lower(person_type) || target_object.isTopFreePosition == "any"){
					target_x = target_object.x - target_object.offcenter_x;
					target_y = target_object.y - target_object.offcenter_y - 64;
				}else if(target_object.isRightFreePosition == string_lower(person_type) || target_object.isRightFreePosition == "any"){
					target_x = target_object.x - target_object.offcenter_x + 64;
					target_y = target_object.y - target_object.offcenter_y;
				}else if(target_object.isBottomFreePosition == string_lower(person_type) || target_object.isBottomFreePosition == "any"){
					target_x = target_object.x - target_object.offcenter_x;
					target_y = target_object.y - target_object.offcenter_y + 64;
				}
		
				if((target_object.isLeftFreePosition != string_lower(person_type) && target_object.isTopFreePosition != string_lower(person_type) && target_object.isRightFreePosition != string_lower(person_type) && target_object.isBottomFreePosition != string_lower(person_type)) && (target_object.isLeftFreePosition != "any" && target_object.isTopFreePosition != "any" && target_object.isRightFreePosition != "any" && target_object.isBottomFreePosition != "any")){
					target_object = noone;
					interaction_attempts+=50;
				}else{
					var path_found = mp_grid_path(obj_game_run.collision_grid,path,x,y,target_x,target_y,true);
					if(path_found){
						path_start(path,person_speed,path_action_stop,true);
					}else{
						target_object = noone;
						if(interaction_attempts != undefined){
							interaction_attempts+=50;
						}
					}
				}
			}else{
				target_object = noone;
			}
		}
	}else if(target_type == "POINT"){
		var path_found = mp_grid_path(obj_game_run.collision_grid,path,x,y,target_x,target_y,true);
		if(path_found){
			path_start(path,person_speed,path_action_stop,true);
		}
	}
}


alarm_set(0,60);