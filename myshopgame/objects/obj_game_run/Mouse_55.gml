if(camera_move_enabled == false){
	camera_move_enabled = true;
	camera_move_xstart = display_mouse_get_x();
	camera_move_ystart = display_mouse_get_y();
	camera_move_xwindow = camera_get_view_x(view_camera[0]);
	camera_move_ywindow = camera_get_view_y(view_camera[0]);
}