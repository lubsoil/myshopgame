/// @description Uruchomienie/Wyłączenie kasy sklepowej
cashregister_available = not cashregister_available;
if(!cashregister_available){
	ds_list_clear(queue_customer);
}