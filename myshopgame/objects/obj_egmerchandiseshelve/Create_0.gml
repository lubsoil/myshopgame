/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
event_inherited();

ds_map_add(product_stock_default, "SCFIGURE",8);
ds_map_add(product_stock_default, "EFTSFIGURE",8);

ds_map_copy(product_stock,product_stock_default);

event_user(1);