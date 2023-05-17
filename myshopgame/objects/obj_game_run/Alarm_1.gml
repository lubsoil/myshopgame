/// @description Generowanie klientów
var time_for_alarm = 240;
if(!obj_game_run.game_paused){
	if(instance_number(obj_entrance) > 0){
		var random_entrance = instance_find(obj_entrance,floor(random(instance_number(obj_entrance))));
		var customer_amount =  instance_number(obj_customer);
		var chance_generator = floor(random(100));
		var min_guests = obj_game_run.guests_minimum;
		var max_guests = obj_game_run.guests_maximum;
		var chance_to_spawn = 1 - ((customer_amount - min_guests)/(max_guests-min_guests));
	
		if(chance_to_spawn > 1){
			time_for_alarm = 120;
		}

		if(chance_generator < chance_to_spawn*100){
			instance_create_layer(random_entrance.x,random_entrance.y,"Instances",obj_customer);
		}
	}
	
}

alarm_set(1,time_for_alarm);