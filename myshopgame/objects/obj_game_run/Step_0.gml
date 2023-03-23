if(camera_move_enabled){
	view_xport[0] = camera_move_xwindow - (camera_move_xstart - mouse_x)*0.75;
	view_yport[0] = camera_move_ywindow - (camera_move_ystart - mouse_y)*0.75;
}

shop_popularity = (instance_number(obj_cashregister) * 0.5) + (instance_number(obj_shelf) * ceil(ds_list_size(available_products)/2.5)) * (instance_number(obj_atmmachine) > 0 ? 2.5 : 1);
guests_minimum = 1 + floor(0.34*shop_popularity);
guests_maximum = 3 + floor(0.75*shop_popularity);