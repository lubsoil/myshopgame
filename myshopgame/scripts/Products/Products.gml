// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function getProductCost(name){
	switch(name){
		case "VEGTABLE":
			return 3;
		case "FRUIT":
			return 4;
		case "FROZENPRODUCT":
			return 7;
		case "BOOK":
			return 15;
		case "COMIC":
			return 25;
		case "NEWSPAPER":
			return 10;
		case "VINYL":
			return 14;
		case "MUSICDISC":
			return 8;
		case "SHOES":
			return 18;
		case "SMALLPLUSHIE":
			return 8;
		case "BIGPLUSHIE":
			return 16;
		default:
			return 10;
	}
}

function getAvailableProducts(list = undefined){
	if(list == undefined){
		list = ds_list_create();
	}
	ds_list_clear(list);
	
	for(var i=0;i<instance_number(obj_shelf);i++){
		var shelf = instance_find(obj_shelf,i);
		var key = ds_map_find_first(shelf.product_stock_default);
		while(key != undefined){
			if(ds_list_find_index(list,key) == -1){
				ds_list_add(list,key);	
			}
			key = ds_map_find_next(shelf.product_stock_default,key);
		}
	}
	
	return list;
}
