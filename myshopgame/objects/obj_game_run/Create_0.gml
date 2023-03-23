camera_move_xwindow = 0;
camera_move_ywindow = 0;
camera_move_xstart = 0;
camera_move_ystart = 0;
camera_move_enabled = false;

debug_info_display = true;

buildings_list = loadBuildingList();
buildings_tags = getListOfUniqueBuildingTags(buildings_list);


buildmode_items_tag = ds_list_find_value(buildings_tags,0);
buildmode_items_list = findBuildingsWithTag(buildings_list,buildmode_items_tag);
buildmode_object = undefined;
buildmode_mode = 0;
buildmode_direction = 0;



collision_grid = mp_grid_create(0,0,room_width/64,room_height/64,64,64);
mp_grid_add_instances(collision_grid,obj_buildingobject,0);

available_products = getAvailableProducts();

show_popularity = 0;

guests_minimum = 1;
guests_maximum = 3;

user_money = 500;