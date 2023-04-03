/// @description AKTYWACJA/DEAKTYWACJA MECHANIZMU ZEPSUTEJ KASY
if(machine_broken){
	machine_broken = false;
	machine_brokechance = 0;
	cashregister_available = true;
	repair_worker = noone;
	image_index = 0;
}else{
	cashregister_available = false;
	ds_list_clear(queue_customer);
	machine_broken = true;
	image_index = 1;
}