var isLeftWall = position_meeting(x-64,y,obj_wall);
var isTopWall = position_meeting(x,y-64,obj_wall);
var isRightWall = position_meeting(x+64,y,obj_wall);
var isBottomWall = position_meeting(x,y+64,obj_wall);

if(isTopWall && isBottomWall && !isLeftWall && !isRightWall){
	//GÓRA DÓŁ
	image_index = 0;
	image_angle = 90;
}else if(isLeftWall && isRightWall && !isTopWall && !isBottomWall){
	//LEWO PRAWO
	image_index = 0;
	image_angle = 0;
}else if(isTopWall && isLeftWall && !isRightWall && !isBottomWall){
	image_index = 1;
	image_angle = 270;
}else if(isTopWall && isRightWall && !isLeftWall && !isBottomWall){
	image_index = 1;
	image_angle = 180;
}else if(isBottomWall && isLeftWall && !isRightWall && !isTopWall){
	image_index = 1;
	image_angle = 0;
}else if(isBottomWall && isRightWall && !isLeftWall && !isTopWall){
	image_index = 1;
	image_angle = 90;
}else if(isBottomWall && isRightWall && isLeftWall && !isTopWall){
	image_index = 2;
	image_angle = 90;
}else if(isBottomWall && !isRightWall && isLeftWall && isTopWall){
	image_index = 2;
	image_angle = 0;
}else if(!isBottomWall && isRightWall && isLeftWall && isTopWall){
	image_index = 2;
	image_angle = 270;
}else if(isBottomWall && isRightWall && !isLeftWall && isTopWall){
	image_index = 2;
	image_angle = 180;
}else if(isBottomWall && isRightWall && isLeftWall && isTopWall){
	image_index = 3;
	image_angle = 0;
}



isLeftFreePosition = "none";
isTopFreePosition = "none";
isRightFreePosition = "none";
isBottomFreePosition =  "none";