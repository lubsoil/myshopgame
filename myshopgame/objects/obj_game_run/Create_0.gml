camera_move_xwindow = 0;
camera_move_ywindow = 0;
camera_move_xstart = 0;
camera_move_ystart = 0;
camera_move_enabled = false;

ui_tabs_selected = undefined;

debug_info_display = false;
if(debug_mode == true || GM_build_type == "run"){
	debug_info_display = true;
}

//TRYB BUDOWANIA

buildings_list = loadBuildingList();
buildings_tags = getListOfUniqueBuildingTags(buildings_list);

buildmode_items_tag = "ALL";
buildmode_items_list = buildmode_items_tag == "ALL" ? buildings_list : findBuildingsWithTag(buildings_list,buildmode_items_tag);
buildmode_object = undefined;
buildmode_mode = 0;
buildmode_direction = 0;

//CZAS

time_day = 1;
time_hour = 360;

//KOLIZJE

collision_grid = mp_grid_create(0,0,room_width/64,room_height/64,64,64);
mp_grid_add_instances(collision_grid,obj_buildmodeobject,0);

//ZADANIA
quests_list = ds_list_create();

//POCZĄTKOWE ZADANIE NA POSTAWIENIE PODSTAWOWYCH BLOCZKÓW
var start_game_quest = ds_map_create();
ds_map_add(start_game_quest,"NAME","START_BASICOBJECTS");
var progress_map = ds_map_create();
ds_map_add(progress_map,"SHELVE",false);
ds_map_add(progress_map,"CASHREGISTER",false);
ds_map_add_map(start_game_quest,"PROGRESS",progress_map);
ds_map_add(start_game_quest,"COMPLETED", false);

ds_list_add(quests_list,start_game_quest);
ds_list_mark_as_map(quests_list,ds_list_size(quests_list)-1);


//INNE

available_products = getAvailableProducts();
queue_cashregister_highest = getHighestCashRehisterQueue();

//POPULARNOŚĆ

shop_popularity = 0;

guests_minimum = 1;
guests_maximum = 1;

//FINANSE

sales_margin = 1.0;

money_usage_history = ds_list_create();
money_usage_now = ds_map_create();
ds_list_add(money_usage_history,money_usage_now);
ds_list_mark_as_map(money_usage_history,ds_list_size(money_usage_history)-1);

user_money = 500;

alarm[0] = 60;