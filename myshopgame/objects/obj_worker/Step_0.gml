texture_rotation = direction;
if(worker_state == 0){
	var empty_shelf = tryFindEmptyShelf();
	var broken_selfcashregister = tryFindBrokenSelfCashRegister();
	var free_workercashregister = tryFindFreeWorkerCashRegister();
	var broken_atmmachine = tryFindBrokenATMMachine();
	var trash_shoppingcart = tryFindShoppingCartTrash();
	
	if(free_workercashregister != noone && worker_ai_cashregister){
		worker_state = 3;
		setObjectPathfinding(free_workercashregister);
		target_object.workplace_worker = self;
		interaction_attempts = 0;
	}else if(broken_selfcashregister != noone && worker_ai_repairing){
		worker_state = 2;
		setObjectPathfinding(broken_selfcashregister);
		target_object.repair_worker = self;
		interaction_time = 360 - skill_repairing*60;
		interaction_attempts = 0;
	}else if(empty_shelf != noone && worker_ai_productstacking){
		worker_state = 1;
		setObjectPathfinding(empty_shelf);
		target_object.restock_worker = self;
		interaction_time = 360 - skill_productstacking*60;
		interaction_attempts = 0;
	}else if(broken_atmmachine != noone && worker_ai_repairing){
		worker_state = 4;
		setObjectPathfinding(broken_atmmachine);
		target_object.repair_worker = self;
		interaction_time = 360 - skill_repairing*60;
		interaction_attempts = 0;
	}else if(trash_shoppingcart != noone && worker_ai_cleaning){
		worker_state = 5;
		setObjectPathfinding(trash_shoppingcart);
		target_object.trash_worker = self;
		interaction_time = 120 - skill_cleaning*20;
		interaction_attempts = 0;
	}else{
		if(point_distance(x,y,target_x,target_y) < 10 || target_type == "NONE"){
			if(instance_number(obj_buildmodeobject) > 0){
				var random_building_element = instance_find(obj_buildmodeobject,floor(random(instance_number(obj_buildmodeobject))));
				var point_x = random_building_element.x + (floor(random(5))-2)*64;
				var point_y = random_building_element.y + (floor(random(5))-2)*64;
				while(instance_position(point_x,point_y,obj_buildmodeobject) != noone){
					random_building_element = instance_find(obj_buildmodeobject,floor(random(instance_number(obj_buildmodeobject))));
					point_x = random_building_element.x + (floor(random(5))-2)*64;
					point_y = random_building_element.y + (floor(random(5))-2)*64;
				}
				setPointPathfinding(point_x,point_y);
			}
		}
	}
}else if(worker_state == 1 && worker_ai_productstacking){
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
				gainSkillProgress("PRODUCTSTACKING")
				resetPathfinding();
				worker_state = 0;
			}
		}else{
			setObjectPathfinding(tryFindEmptyShelf());
			if(target_object != noone){
				target_object.restock_worker = self;
			}
			interaction_time = 360 - skill_productstacking*60;
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
		interaction_time = 360 - skill_productstacking*60;
	}
}else if(worker_state == 2 && worker_ai_repairing){
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
				gainSkillProgress("REPAIRING")
				resetPathfinding();
				worker_state = 0;
			}
		}else{
			setObjectPathfinding(tryFindBrokenSelfCashRegister());
			if(target_object != noone){
				target_object.repair_worker = self;
			}
			interaction_time = 360 - skill_repairing*60;
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
		interaction_time = 360 - skill_repairing*60;
	}
}else if(worker_state == 3 && worker_ai_cashregister){
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
}else if(worker_state == 4 && worker_ai_repairing){
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
				gainSkillProgress("REPAIRING")
				resetPathfinding();
				worker_state = 0;
			}
		}else{
			setObjectPathfinding(tryFindBrokenATMMachine());
			if(target_object != noone){
				target_object.repair_worker = self;
			}
			interaction_time = 360 - skill_repairing*60;
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
		interaction_time = 360 - skill_repairing*60;
	}
}else if(worker_state == 5 && worker_ai_cleaning){
	if(shoppingcart_type != undefined)
	{
		//ODKŁADANIE KOSZYKA
		if(isTargetValid()){
			if(target_object.shoppingcart_amount < target_object.shoppingcart_maximum){
				if(interaction_time > 0){
					if(point_distance(x,y,target_x,target_y) < 10){
						texture_rotation = point_direction(x,y,target_object.x,target_object.y);
						interaction_time--;
					}
				}else{
					target_object.shoppingcart_amount++;
					shoppingcart_type = undefined;
					worker_state = 0;
					resetPathfinding();
				}
			}
		}else{
			setObjectPathfinding(tryFindNotFullShoppingCart(shoppingcart_type));
			if(target_object == noone){
				if(interaction_attempts > 100){
					resetPathfinding();
					worker_state = 0;
					interaction_attempts = 0;
					shoppingcart_type = undefined;
					worker_state = 0;
				}else{
					interaction_attempts++;
				}	
			}
			interaction_time = 60 - skill_cleaning*10;
		}
	}
	else
	{
		//PODNOSZENIE KOSZYKA
		if(isTargetValid()){
			if(interaction_time > 0){
				if(point_distance(x,y,target_x,target_y) < 10){
					texture_rotation = point_direction(x,y,target_object.x,target_object.y);
					interaction_time--;
				}
			}else{
				shoppingcart_type = target_object.shoppingcart_type;
				gainSkillProgress("CLEANING");
				with(target_object)
				{
					instance_destroy();
				}
				resetPathfinding();
			}
		}else{
			setObjectPathfinding(tryFindNotEmptyShoppingCart());
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
			interaction_time = 60 - skill_cleaning*10;
		}
	}
}else{
	if(isTargetValid()){
		if(worker_state == 1){
			target_object.restock_worker = noone;
		}else if(worker_state == 2){
			target_object.repair_worker = noone;
		}else if(worker_state == 3){
			target_object.workplace_worker = noone; 
			target_object.cashregister_available = false;
		}else if(worker_state == 4){
			target_object.repair_worker = noone;
		}else if(worker_state == 5){
			target_object.trash_worker = noone;
			shoppingcart_type = undefined;
		}
	}
	resetPathfinding();
	worker_state = 0;
	interaction_attempts = 0;
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