/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
var customer_amount =  instance_number(obj_customer);
var chance_generator = floor(random(100));
var min_guests = obj_game_run.guests_minimum;
var max_guests = obj_game_run.guests_maximum;
var chance_to_spawn = 1 - ((customer_amount - min_guests)/(max_guests-min_guests));

if(chance_generator < chance_to_spawn*100 ){
	instance_create_layer(x,y,"Instances",obj_customer);
}


alarm_set(0,240);

