/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
isLeftFreePosition = "none";
isTopFreePosition = "none";
isRightFreePosition = "none";
isBottomFreePosition = "none";

offcenter_x = 0;
offcenter_y = 0;

var temp_instance = instance_position(x-64,y,obj_buildmodeobject);
if(temp_instance != noone){
	with(temp_instance){
		event_user(0);	
	}
}
temp_instance = instance_position(x,y-64,obj_buildmodeobject);
if(temp_instance != noone){
	with(temp_instance){
		event_user(0);	
	}
}
temp_instance = instance_position(x+64,y,obj_buildmodeobject);
if(temp_instance != noone){
	with(temp_instance){
		event_user(0);	
	}
}
temp_instance = instance_position(x,y+64,obj_buildmodeobject);
if(temp_instance != noone){
	with(temp_instance){
		event_user(0);	
	}
}

event_user(0);