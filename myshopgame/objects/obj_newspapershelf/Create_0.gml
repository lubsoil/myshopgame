/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
event_inherited();

building_cost = 55;

ds_map_add(product_stock_default, "NEWSPAPER",5);
ds_map_add(product_stock_default, "COMIC",5);

ds_map_copy(product_stock,product_stock_default);

event_user(1);