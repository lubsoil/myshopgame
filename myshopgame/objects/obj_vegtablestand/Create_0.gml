/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
event_inherited();

building_cost = 30;

ds_map_add(product_stock_default, "VEGTABLE",15);

ds_map_copy(product_stock,product_stock_default);

event_user(1);