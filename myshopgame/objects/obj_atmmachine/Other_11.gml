/// @description AKTYWACJA/DEAKTYWACJA MECHANIZMU ZEPSUTEJ BANKOMATU
if(machine_broken){
	machine_broken = false;
	machine_brokechance = 0;
	atmmachine_available = true;
	repair_worker = noone;
}else{
	atmmachine_available = false;
	machine_broken = true;
}