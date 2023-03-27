texture_rotation = direction;
if(customer_state == 0){
	if(atmmachine_need == true && atmmachine_used == false){
		customer_state = 4;
		interaction_attempts = 0;
	}else if(ds_list_size(shopping_list) > 0){
		customer_state = 1;	
	}else if(ds_list_size(cart_list) > 0){
		customer_state = 2;	
	}else{
		customer_state = 3;	
	}
	resetPathfinding();
}else if(customer_state == 1){
	//GETTING PRODUCTS STAGE
	if(ds_list_size(shopping_list) > 0){
		if(isTargetValid()){
			var product_name = ds_list_find_value(shopping_list,current_product);
			var shelf_amount = target_object.product_stock[? product_name];
			if(shelf_amount > 0){
				if(interaction_time > 0){
					if(point_distance(x,y,target_x,target_y) < 10){
						texture_rotation = point_direction(x,y,target_object.x,target_object.y);
						interaction_time--;
					}
				}else{
						
					interaction_attempts = 0;
					target_object.product_stock[? product_name] -= 1;
						
					if(target_object.product_stock[? product_name] == 0){
						target_object.product_stock_empty = true;
					}
						
					ds_list_add(cart_list,product_name);
					ds_list_delete(shopping_list,current_product);
					current_product = floor(random(ds_list_size(shopping_list)));
					
					interaction_time = 120;
					target_x = -100;
					target_y = -100;
					target_object = noone;
				}
			}else{
				setObjectPathfinding(findCurrentProduct());
				if(target_object == noone){
					if(interaction_attempts > 100){
						interaction_attempts = 0;
						ds_list_delete(shopping_list,current_product);
						current_product = floor(random(ds_list_size(shopping_list)));
					}else{
						interaction_attempts++;	
					}
				}	
			}
		}else{
			setObjectPathfinding(findCurrentProduct());
			if(target_object == noone){
				if(interaction_attempts > 100){
					interaction_attempts = 0;
					ds_list_delete(shopping_list,current_product);
					current_product = floor(random(ds_list_size(shopping_list)));
				}else{
					interaction_attempts++;	
				}
			}	
		}
	}else{
		target_object = noone;
		target_x = -100;
		target_y = -100;
		if(ds_list_size(cart_list) > 0){
			customer_state = 2;
			interaction_time = undefined;	
		}else{
			customer_state = 3;
			interaction_time = 20;	
		}
		alarm_set(0, 2);
	}
}else if(customer_state == 2){
	if(target_object != noone){
		if(instance_exists(target_object)){
			if(target_object.cashregister_available){
				if(point_distance(x,y,target_x,target_y) < 10){
					if(interaction_time == undefined){
						if(target_object.object_index == obj_selfcashregister){
							interaction_time = 120 + 30*ds_list_size(cart_list);
						}else if(target_object.object_index == obj_workercashregister){
							interaction_time = 300 - target_object.workplace_worker.skill_cashregister*60;
						}
					}else if(interaction_time > 0){
						interaction_time--;
						texture_rotation = point_direction(x,y,target_object.x,target_object.y);
					}else{
						if(ds_list_size(cart_list) > 0){
							sellAllProducts();
							//PSUCIE SIĘ KASY SKLEOPWEJ
							if(target_object.object_index == obj_selfcashregister){
								var broke_chance = floor(random(100));
								if(target_object.machine_brokechance > broke_chance){
									with(target_object){
										event_user(1);	
									}
								}else{
									target_object.machine_brokechance+=1;
								}
							}
							if(target_object.object_index == obj_workercashregister){
								with(target_object.workplace_worker){
									gainSkillProgress("CASHREGISTER");	
								}
							}
						}else{
							customer_state = 3;
							interaction_time = 20;
							target_object = noone;
							target_x = -100;
							target_y = -100;
							alarm_set(0, 2);
						}
					
					}
				}
			}else{
				setObjectPathfinding(tryFindWorkingCashRegister());
			}
			
		}else{
			setObjectPathfinding(tryFindWorkingCashRegister());
		}
	}else{
		setObjectPathfinding(tryFindWorkingCashRegister());
	}
}else if(customer_state == 3){
	if(isTargetValid()){
		if(point_distance(x,y,target_x,target_y) < 1){
			if(interaction_time > 0){
				interaction_time--;
			}else{
				instance_destroy();
			}
		}
	}else{
		setObjectPathfinding(instance_nearest(x,y,obj_entrance));
	}
}else if(customer_state == 4){
	if(atmmachine_used == false){
		if(isTargetValid()){
			if(target_object.atmmachine_available){
				if(point_distance(x,y,target_x,target_y) < 10){
					if(interaction_time > 0){
						texture_rotation = point_direction(x,y,target_object.x,target_object.y);
						interaction_time--;
					}else{
						atmmachine_used = true;
					
						for(var i=0;i< 1+ceil(random(2));i++){
							var randomized_number = floor(random(ds_list_size(obj_game_run.available_products)));
							if(ds_list_size(obj_game_run.available_products) == 0){
								ds_list_add(shopping_list,"OTHER")
							}else{
								ds_list_add(shopping_list, ds_list_find_value(obj_game_run.available_products,randomized_number));	
							}
						}
					
						var broke_chance = floor(random(100));
						if(target_object.machine_brokechance > broke_chance){
							with(target_object){
								event_user(1);	
							}
						}else{
							target_object.machine_brokechance+=1;
						}
					
						customer_state = 0;
						resetPathfinding();
					}
				}
			}else{
				resetPathfinding();	
			}
			
		}else{
			setObjectPathfinding(tryFindWorkingATMMachine());
			if(isTargetValid() == false){
				if(interaction_attempts > 100){
					atmmachine_used = true;
					interaction_attempts = 0;
					customer_state = 0;
					resetPathfinding();
				}else{
					interaction_attempts++;
				}
			}
			
		}
	}else{
		customer_state = 0;
		resetPathfinding();
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