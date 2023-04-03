if(camera_move_enabled){
	camera_set_view_pos(view_camera[0],camera_move_xwindow - (camera_move_xstart - display_mouse_get_x())*0.75,camera_move_ywindow - (camera_move_ystart - display_mouse_get_y())*0.75);
}


//OBLICZANIE POPULARNOŚCI
var popularity = 0;

popularity += (instance_number(obj_cashregister) * 2.25)/(queue_cashregister_highest != 0 ? queue_cashregister_highest : 1);
popularity += (instance_number(obj_shelf) * ceil(ds_list_size(available_products)/2.5)) * (instance_number(obj_atmmachine) > 0 ? 2.5 : 1)

var time_multiplier = 1.0;
if(time_hour >= 510 && time_hour <= 869){
	time_multiplier = 0.75;
}else if(time_hour >= 870 && time_hour <= 1049){
	time_multiplier = 1.25;
}

popularity *= time_multiplier;



shop_popularity = popularity;
guests_minimum = 1 + floor(0.34*shop_popularity);
guests_maximum = 2 + floor(0.69*shop_popularity);