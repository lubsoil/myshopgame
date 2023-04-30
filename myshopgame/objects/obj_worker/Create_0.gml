/// @description CREATE EVENT
event_inherited();

worker_name = getRandomPeopleName();
worker_salary = 25;

person_type = "WORKER";

appearance_head = floor(random(2));
appearance_top = make_color_rgb(255,20,147);
appearance_bottom =  make_color_rgb(255,20,147);

worker_state = 0; 
/*
	WORKER_STATES
	0 - RANDOM MOVING
	1 - RESTOCKING SHELVES
	2 - FIXING SELF CASH REGISTER
	3 - WORKING WITH CASH REGISTER
	4 - FIXING ATM MACHINE
*/

//UMIEJĘTNOŚCI PRACOWNIKÓW
skill_cashregister = 0;
skill_productstacking = 0;
skill_repairing = 0;

skill_cashregister_progress = 0;
skill_productstacking_progress = 0;
skill_repairing_progress = 0;

//ZADANIA PRACOWNIKÓW
worker_ai_cashregister = true;
worker_ai_productstacking = true;
worker_ai_repairing = true;



interaction_time = 120;
interaction_attempts = 0;

alarm[0] = 2;

function tryFindEmptyShelf(){
	var amount_shelfs = instance_number(obj_shelf);
		
	if(amount_shelfs > 0){
		var shelf = instance_find(obj_shelf, floor(random(amount_shelfs)));
		if(shelf.product_stock_empty && shelf.restock_worker == noone){
			return shelf;
		}
	}
	
	return noone;
}

function tryFindBrokenSelfCashRegister(){
	var amount_cashregister = instance_number(obj_selfcashregister);
		
	if(amount_cashregister > 0){
		var cashregister = instance_find(obj_selfcashregister, floor(random(amount_cashregister)));
		if(cashregister.machine_broken && cashregister.repair_worker == noone){
			return cashregister;
		}
	}
	
	return noone;
}

function tryFindBrokenATMMachine(){
	var amount_atmmachine = instance_number(obj_atmmachine);
		
	if(amount_atmmachine > 0){
		var atmmachine = instance_find(obj_atmmachine, floor(random(amount_atmmachine)));
		if(atmmachine.machine_broken && atmmachine.repair_worker == noone){
			return atmmachine;
		}
	}
	
	return noone;
}

function tryFindFreeWorkerCashRegister(){
	var amount_cashregister = instance_number(obj_workercashregister);
		
	if(amount_cashregister > 0){
		var cashregister = instance_find(obj_workercashregister, floor(random(amount_cashregister)));
		if(cashregister.cashregister_available == false && cashregister.workplace_worker == noone){
			return cashregister;
		}
	}
	
	return noone;
}

function gainSkillProgress(type){
	switch(type){
		case "REPAIRING":
			if(skill_repairing_progress < 10*skill_repairing + 7){
				skill_repairing_progress++;
			}else{
				if(skill_repairing < 3){
					skill_repairing++;
					skill_repairing_progress=0;
				}
			}
		break;
		case "CASHREGISTER":
			if(skill_cashregister_progress < 25*skill_cashregister + 15){
				skill_cashregister_progress++;
			}else{
				if(skill_cashregister < 3){
					skill_cashregister++;
					skill_cashregister_progress=0;
				}
			}
		break;
		case "PRODUCTSTACKING":
			if(skill_productstacking_progress < 15*skill_productstacking + 10){
				skill_productstacking_progress++;
			}else{
				if(skill_productstacking < 3){
					skill_productstacking++;
					skill_productstacking_progress=0;
				}
			}
		break;
	}
	
	worker_salary = 25 + skill_productstacking*3 + skill_cashregister*3 + skill_repairing*3
}


image_speed = 0;