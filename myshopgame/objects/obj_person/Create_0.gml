/// @description AKCJA TWORZENIA
person_type = "PERSON";
person_speed = 0.5;

//PATHFIDING SYSTEM
path = path_add();

target_type = "NONE";
target_object = noone;
target_x = -100;
target_y = -100;

depth = -1;

function resetPathfinding(){
	target_type = "NONE";
	target_object = noone;
	target_x = -100;
	target_y = -100;
}

function setObjectPathfinding(target){
	target_type = "OBJECT";
	target_object = target;
	target_x = -100;
	target_y = -100;
	alarm_set(0,1);
}

function setPointPathfinding(point_x,point_y){
	target_type = "POINT";
	target_x = point_x;
	target_y = point_y;
	alarm_set(0,1);
}

function isTargetValid(){
	if(target_object != noone && target_object != undefined){
		if(instance_exists(target_object)){
			return true;
		}
	}
	return false;
}