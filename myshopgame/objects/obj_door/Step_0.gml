/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(door_position == "LEFT"){
	if(!door_opened){
		image_index = 0;
	}else{
		image_index = 1;
	}
}else{
	if(!door_opened){
		image_index = 2;
	}else{
		image_index = 3;
	}
}
door_opened = false;

