/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(instance_number(obj_entrance) > 0){
	var entrance = instance_find(obj_entrance,floor(random(instance_number(obj_entrance))));
	instance_create_layer(entrance.x,entrance.y,"Instances",obj_worker);
}