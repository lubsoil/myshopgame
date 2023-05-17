/// @description Ustalanie pozycji drzwi
var isLeftWall = position_meeting(x-64,y,obj_wall);
var isTopWall = position_meeting(x,y-64,obj_wall);
var isRightWall = position_meeting(x+64,y,obj_wall);
var isBottomWall = position_meeting(x,y+64,obj_wall);

if(direction == 0){
	if(isLeftWall){
		door_position = "LEFT";	
	}else{
		door_position = "RIGHT";
	}
}else if(direction == 90){
	if(isBottomWall){
		door_position = "LEFT";	
	}else{
		door_position = "RIGHT";
	}
}else if(direction == 180){
	if(isRightWall){
		door_position = "LEFT";	
	}else{
		door_position = "RIGHT";
	}
}else if(direction == 270){
	if(isTopWall){
		door_position = "LEFT";	
	}else{
		door_position = "RIGHT";
	}
}