/// @description Upływ czasu
if(time_hour < 1320){
	time_hour++;
}else{
	time_hour = 360;
	time_day++;
	
	for(var i=0; i<instance_number(obj_worker); i++){
		removeMoney(obj_worker.worker_salary, "WORKER");
	}
	
}
alarm[0] = 45;