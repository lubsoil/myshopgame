// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function getProductCost(name){
	switch(name){
		case "VEGTABLE":
			return 2;
		case "FRUIT":
			return 3;
		case "ICECREAM":
			return 5;
		case "FRIES":
			return 5;
		case "VEGETABLEMIX":
			return 5;
		case "BOOK":
			return 15;
		case "COMIC":
			return 10;
		case "NEWSPAPER":
			return 4;
		case "VINYL":
			return 25;
		case "MUSICDISC":
			return 10;
		case "SHOES":
			return 30;
		case "SMALLPLUSHIE":
			return 6;
		case "BIGPLUSHIE":
			return 12;
		case "BOARDGAME":
			return 20;
		case "SCFIGURE":
			return 8;
		case "EFTSFIGURE":
			return 8;
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
