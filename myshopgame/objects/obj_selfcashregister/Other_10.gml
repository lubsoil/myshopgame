/// @description USTAWIANIE INFORMACJI O DOSTĘPNOŚCI MIEJSCA DO OBIEKTU
isLeftFreePosition = "none";
isTopFreePosition = "none";
isRightFreePosition = "none";
isBottomFreePosition = "none";

if(direction == 0){
	isTopFreePosition = instance_position(x,y-64,obj_buildmodeobject) == noone ? "any" : "none";
}else if(direction == 90){
	isLeftFreePosition = instance_position(x-64,y,obj_buildmodeobject) == noone ? "any" : "none";
}else if(direction == 180){
	isBottomFreePosition = instance_position(x,y+64,obj_buildmodeobject) == noone ? "any" : "none";
}else if(direction == 270){
	isRightFreePosition = instance_position(x+64,y,obj_buildmodeobject)  == noone ? "any" : "none";
}