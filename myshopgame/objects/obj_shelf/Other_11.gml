/// @description Item Restock
var loop_item = ds_map_find_first(product_stock);
var total_restock_cost = 0;
while(loop_item != undefined){
	var default_amount = product_stock_default[? loop_item];
	var current_amount = product_stock[? loop_item];
	
	var product_cost = floor(getProductCost(loop_item)*0.6);
	
	var diffrence = default_amount - current_amount;
	
	total_restock_cost += product_cost*diffrence;
	
	loop_item = ds_map_find_next(product_stock,loop_item);
}

if(obj_game_run.user_money >= total_restock_cost){
	obj_game_run.user_money -= total_restock_cost;
	product_stock_empty = false;
	restock_worker = noone;
	ds_map_copy(product_stock,product_stock_default);
}else{
	product_stock_empty = false;
	restock_worker = noone;
	alarm[0] = 300;
}