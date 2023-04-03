/// @description USTAWIANIE INFORMACJI O DOSTĘPNOŚCI MIEJSCA DO OBIEKTU
isLeftFreePosition = "none";
isTopFreePosition = "none";
isRightFreePosition = "none";
isBottomFreePosition = "none";

if(direction == 0){
	var isFreePlace = instance_position(x,y-64,obj_buildmodeobject) == noone && instance_position(x,y+64,obj_buildmodeobject) == noone;
	isTopFreePosition = isFreePlace ? "customer" : "none";
	isBottomFreePosition = isFreePlace ? "worker" : "none";
}else if(direction == 90){
	var isFreePlace = instance_position(x-64,y,obj_buildmodeobject) == noone && instance_position(x+64,y,obj_buildmodeobject) == noone;
	isLeftFreePosition = isFreePlace ? "customer" : "none";
	isRightFreePosition = isFreePlace ? "worker" : "none";
}else if(direction == 180){
	var isFreePlace = instance_position(x,y-64,obj_buildmodeobject) == noone && instance_position(x,y+64,obj_buildmodeobject) == noone;
	isTopFreePosition = isFreePlace ? "worker" : "none";
	isBottomFreePosition = isFreePlace ? "customer" : "none";
}else if(direction == 270){
	var isFreePlace = instance_position(x-64,y,obj_buildmodeobject) == noone && instance_position(x+64,y,obj_buildmodeobject) == noone;
	isLeftFreePosition = isFreePlace ? "worker" : "none";
	isRightFreePosition = isFreePlace ? "customer" : "none";
}