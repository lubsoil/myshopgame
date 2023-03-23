texture_rotation = direction;
if(worker_state == 0){
	var empty_shelf = tryFindEmptyShelf();
	var broken_selfcashregister = tryFindBrokenSelfCashRegister();
	var free_workercashregister = tryFindFreeWorkerCashRegister();
	var broken_atmmachine = tryFindBrokenATMMachine();
	
	if(free_workercashregister != noone){
		worker_state = 3;
		setObjectPathfinding(free_workercashregister);
		target_object.workplace_worker = self;
		interaction_attempts = 0;
	}else if(broken_selfcashregister != noone){
		worker_state = 2;
		setObjectPathfinding(broken_selfcashregister);
		target_object.repair_worker = self;
		interaction_time = 120;
		interaction_attempts = 0;
	}else if(empty_shelf != noone){
		worker_state = 1;
		setObjectPathfinding(empty_shelf);
		target_object.restock_worker = self;
		interaction_time = 120;
		interaction_attempts = 0;
	}else if(broken_atmmachine != noone){
		worker_state = 4;
		setObjectPathfinding(broken_atmmachine);
		target_object.repair_worker = self;
		interaction_time = 120;
		interaction_attempts = 0;
	}else{
		if(point_distance(x,y,target_x,target_y) < 10 || target_type == "NONE"){
			var point_x = 64*floor(random(10))+32;
			var point_y = 64*floor(random(10))+32;
			while(instance_position(point_x,point_y,obj_buildingobject) != noone){
				point_x = 64*floor(random(10))+32;
				point_y = 64*floor(random(10))+32;
			}
			setPointPathfinding(point_x,point_y);
		}
	}
}else if(worker_state == 1){
	if(isTargetValid()){
		if(target_object.product_stock_empty){
			if(interaction_time > 0){
				if(point_distance(x,y,target_x,target_y) < 10){
					texture_rotation = point_direction(x,y,target_object.x,target_object.y);
					interaction_time--;
				}
			}else{
				with(target_object){
					event_user(1);	
				}
				resetPathfinding();
				worker_state = 0;
			}
		}else{
			setObjectPathfinding(tryFindEmptyShelf());
			if(target_object != noone){
				target_object.restock_worker = self;
			}
			interaction_time = 120;
		}
	}else{
		setObjectPathfinding(tryFindEmptyShelf());
		if(target_object != noone){
			target_object.restock_worker = self;
		}else{
			if(interaction_attempts > 100){
				resetPathfinding();
				worker_state = 0;
				interaction_attempts = 0;
			}else{
				interaction_attempts++;
			}	
		}
		interaction_time = 120;
	}
}else if(worker_state == 2){
	if(isTargetValid()){
		if(target_object.machine_broken){
			if(interaction_time > 0){
				if(point_distance(x,y,target_x,target_y) < 10){
					texture_rotation = point_direction(x,y,target_object.x,target_object.y);
					interaction_time--;
				}
			}else{
				with(target_object){
					event_user(1);	
				}
				resetPathfinding();
				worker_state = 0;
			}
		}else{
			setObjectPathfinding(tryFindBrokenSelfCashRegister());
			if(target_object != noone){
				target_object.repair_worker = self;
			}
			interaction_time = 120;
		}
	}else{
		setObjectPathfinding(tryFindBrokenSelfCashRegister());
		if(target_object != noone){
			target_object.repair_worker = self;
		}else{
			if(interaction_attempts > 100){
				resetPathfinding();
				worker_state = 0;
				interaction_attempts = 0;
			}else{
				interaction_attempts++;
			}	
		}
		interaction_time = 120;
	}
}else if(worker_state == 3){
	if(isTargetValid()){
		if(point_distance(x,y,target_x,target_y) < 10){
			texture_rotation = point_direction(x,y,target_object.x,target_object.y);
			target_object.cashregister_available = true;
		}else{
			if(target_object.cashregister_available){
				target_object.cashregister_available = false;
			}
		}
	}else{
		setObjectPathfinding(tryFindFreeWorkerCashRegister());
		if(target_object != noone){
			target_object.workplace_worker = self;
		}else{
			if(interaction_attempts > 100){
				resetPathfinding();
				worker_state = 0;
				interaction_attempts = 0;
			}else{
				interaction_attempts++;
			}
		}
	}
}else if(worker_state == 4){
	if(isTargetValid()){
		if(target_object.machine_broken){
			if(interaction_time > 0){
				if(point_distance(x,y,target_x,target_y) < 10){
					texture_rotation = point_direction(x,y,target_object.x,target_object.y);
					interaction_time--;
				}
			}else{
				with(target_object){
					event_user(1);	
				}
				resetPathfinding();
				worker_state = 0;
			}
		}else{
			setObjectPathfinding(tryFindBrokenATMMachine());
			if(target_object != noone){
				target_object.repair_worker = self;
			}
			interaction_time = 120;
		}
	}else{
		setObjectPathfinding(tryFindBrokenATMMachine());
		if(target_object != noone){
			target_object.repair_worker = self;
		}else{
			if(interaction_attempts > 100){
				resetPathfinding();
				worker_state = 0;
				interaction_attempts = 0;
			}else{
				interaction_attempts++;
			}	
		}
		interaction_time = 120;
	}
}

if(speed == 0){
	direction = texture_rotation;
}


if((texture_rotation >= 338 && texture_rotation <360) || (texture_rotation >= 0 && texture_rotation < 22)){
	image_index = 0;
}else if(texture_rotation >= 23 && texture_rotation < 68){
	image_index = 1;
}else if(texture_rotation >= 69 && texture_rotation < 114){
	image_index = 2;
}else if(texture_rotation >= 115 && texture_rotation < 160){
	image_index = 3;
}else if(texture_rotation >= 161 && texture_rotation < 206){
	image_index = 4;
}else if(texture_rotation >= 207 && texture_rotation < 252){
	image_index = 5;
}else if(texture_rotation >= 253 && texture_rotation < 298){
	image_index = 6;
}else if(texture_rotation >= 299 && texture_rotation < 337){
	image_index = 7;
}