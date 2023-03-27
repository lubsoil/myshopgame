/// @description CREATE EVENT
event_inherited();

person_type = "CUSTOMER";

appearance_head = floor(random(2));
appearance_top = make_color_hsv(floor(random(255)),128,128);
appearance_bottom = make_color_hsv(floor(random(255)),225,225);

customer_state = 0;
/*
	CUSTOMER STATES
	0 - IDLING
	1 - GETTING PRODUCT FROM LIST
	2 - USING CASH REGISTER
	3 - EXITING SHOP
	4 - USING ATM
*/

shopping_list = ds_list_create(); // LISTA CO KLIENT CHCE KUPIĆ

for(var i=0;i< ceil(random(4));i++){
	var randomized_number = floor(random(ds_list_size(obj_game_run.available_products)));
	if(ds_list_size(obj_game_run.available_products) == 0){
		ds_list_add(shopping_list,"OTHER")
	}else{
		ds_list_add(shopping_list, ds_list_find_value(obj_game_run.available_products,randomized_number));	
	}
	
}

cart_list = ds_list_create(); //LISTA ZDOBYTYCH PRODUKTÓW

current_product = floor(random(ds_list_size(shopping_list)));

atmmachine_need = floor(random(5)) == 0 ? true : false;
atmmachine_used = false;

interaction_attempts = 0;
interaction_time = 120;

alarm[0] = 2;

function findCurrentProduct(){
	var current_product_name = ds_list_find_value(shopping_list,current_product);
	
	if(current_product_name == "VEGTABLE"){
		var amount_shelfs = instance_number(obj_vegtablestand);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_vegtablestand, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}	
	}else if( current_product_name = "FRUIT"){
		var amount_shelfs = instance_number(obj_fruitsstand);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_fruitsstand, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}	
	}else if(current_product_name == "FRIES" || current_product_name == "ICECREAM" || current_product_name == "VEGETABLEMIX"){
		var amount_shelfs = instance_number(obj_freezer);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_freezer, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}	
	}else if(current_product_name == "COMIC"||current_product_name == "NEWSPAPER"){
		var amount_shelfs = instance_number(obj_newspapershelf);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_newspapershelf, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}	
	}else if(current_product_name == "BOOK"){
		var amount_shelfs = instance_number(obj_bookshelf);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_bookshelf, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}	
	}else if(current_product_name == "VINYL"||current_product_name == "MUSICDISC"){
		var amount_shelfs = instance_number(obj_musicshelf);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_musicshelf, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}	
	}else if(current_product_name == "SHOES"){
		var amount_shelfs = instance_number(obj_shoesshelf);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_shoesshelf, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}	
	}else if(current_product_name == "SMALLPLUSHIE" || current_product_name == "BIGPLUSHIE"){
		var amount_shelfs = instance_number(obj_plushiesbox);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_plushiesbox, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}	
	}else if(current_product_name == "SCFIGURE" || current_product_name == "EFTSFIGURE"){
		var amount_shelfs = instance_number(obj_egmerchandiseshelve);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_egmerchandiseshelve, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}	
	}else if(current_product_name == "BOARDGAME"){
		var amount_shelfs = instance_number(obj_boardgamesshelve);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_boardgamesshelve, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}	
	}else{
		var amount_shelfs = instance_number(obj_productshelf);
		
		if(amount_shelfs > 0){
			var shelf = instance_find(obj_productshelf, floor(random(amount_shelfs)));
			var stock_amount = shelf.product_stock[? current_product_name];
			if(stock_amount != undefined){
				if(stock_amount > 0){
					return shelf;
				}
			}
		}
	}
	return noone;
}

function tryFindWorkingCashRegister(){
	var amount_cashregister = instance_number(obj_cashregister);
		
	if(amount_cashregister > 0){
		var cashregister = instance_find(obj_cashregister, floor(random(amount_cashregister)));
		if(cashregister.cashregister_available == true){
			return cashregister;
		}
	}
	return noone;
}

function tryFindWorkingATMMachine(){
	var amount_atmmachine = instance_number(obj_atmmachine);
		
	if(amount_atmmachine > 0){
		var atmmachine = instance_find(obj_atmmachine, floor(random(amount_atmmachine)));
		if(atmmachine.atmmachine_available == true){
			return atmmachine;
		}
	}
	return noone;
}

function sellAllProducts(){
	for(var i=0;i<ds_list_size(cart_list);i++){
		var product_name = ds_list_find_value(cart_list, i);
		addMoney(getProductCost(product_name),"PRODUCTSELL");
	}
	ds_list_clear(cart_list);
}

image_speed = 0;