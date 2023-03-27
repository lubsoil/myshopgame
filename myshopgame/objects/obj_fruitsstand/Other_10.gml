/// @description BUILDING OBJECT
isLeftFreePosition = instance_position(x-64,y,obj_buildingobject) == noone ? "any" : "none";
isTopFreePosition = instance_position(x,y-64,obj_buildingobject) == noone ? "any" : "none";
isRightFreePosition = instance_position(x+64,y,obj_buildingobject)  == noone ? "any" : "none";
isBottomFreePosition = instance_position(x,y+64,obj_buildingobject) == noone ? "any" : "none";