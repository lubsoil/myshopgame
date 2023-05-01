if(camera_move_enabled){
	camera_set_view_pos(view_camera[0],camera_move_xwindow - (camera_move_xstart - display_mouse_get_x())*0.75,camera_move_ywindow - (camera_move_ystart - display_mouse_get_y())*0.75);
}


//OBLICZANIE POPULARNOŚCI
var popularity = 0;

popularity += (instance_number(obj_cashregister) * 2.25)/(queue_cashregister_highest != 0 ? queue_cashregister_highest : 1);
popularity += (instance_number(obj_shelf) * ceil(ds_list_size(available_products)/2.5)) * (instance_number(obj_atmmachine) > 0 ? 1.25 : 1)
//DEKORACJE PODŁOGOWE
for(var i=0;i<instance_number(obj_decoration_floor);i++)
{
	var obj =  instance_find(obj_decoration_floor,i);
	popularity += obj.decoration_value;
}
//ŚMIECI
for(var i=0;i<instance_number(obj_trash);i++)
{
	var obj =  instance_find(obj_trash,i);
	popularity -= obj.trash_value;
}



var time_multiplier = 1.0;
if(time_hour >= 510 && time_hour <= 869){
	time_multiplier = 0.75;
}else if(time_hour >= 870 && time_hour <= 1049){
	time_multiplier = 1.25;
}

popularity *= time_multiplier;

var margin_popularity = 1;
if(sales_margin == 0.75){
	margin_popularity = 1.5;
}else if(sales_margin == 1.25){
	margin_popularity = 0.75;
}else if(sales_margin == 1.5){
	margin_popularity = 0.5;
}

popularity *= margin_popularity;



shop_popularity = popularity;
guests_minimum = 1 + floor(0.1*shop_popularity);
guests_maximum = 1 + floor(0.4*shop_popularity);
if(guests_minimum > 20){
	guests_minimum = 20;	
}
if(guests_maximum > 40){
	guests_maximum = 40;	
}