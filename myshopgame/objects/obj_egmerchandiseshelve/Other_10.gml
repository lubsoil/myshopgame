/// @description BUILDING OBJECT
isLeftFreePosition = instance_position(x-64,y,obj_buildmodeobject) == noone ? "any" : "none";
isTopFreePosition = instance_position(x,y-64,obj_buildmodeobject) == noone ? "any" : "none";
isRightFreePosition = instance_position(x+64,y,obj_buildmodeobject)  == noone ? "any" : "none";
isBottomFreePosition = instance_position(x,y+64,obj_buildmodeobject) == noone ? "any" : "none";