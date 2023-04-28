/// @description Upływ czasu
if(time_hour < 1320){
	time_hour++;
}else{
	time_hour = 360;
	time_day++;
	
	for(var i=0; i<instance_number(obj_worker); i++){
		removeMoney(obj_worker.worker_salary, "WORKER");
	}
	
	money_usage_history = ds_list_create();
	money_usage_now = ds_map_create();
	ds_list_add(money_usage_history,money_usage_now);
	ds_list_mark_as_map(money_usage_history,ds_list_size(money_usage_history)-1);
}

queue_cashregister_highest = getHighestCashRehisterQueue();

alarm[0] = 45;