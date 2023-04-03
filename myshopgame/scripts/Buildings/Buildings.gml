//FUNKCJA ŁADUJĄCA LISTĘ BUDYNKÓW (pod edycję)
function loadBuildingList(building_list = undefined){
	if(building_list != undefined){
		if(ds_exists(building_list,ds_type_list)){
			ds_list_destroy(building_list);
		}
	}
	var building_temp = loadJSONFile("buildings.json");
	building_list = ds_list_create();
	
	show_debug_message(building_temp);
	
	for(var i=0;i<array_length(building_temp);i++){
		var building = building_temp[i];
		var building_new = ds_map_create();
		ds_map_add(building_new,"NAME",building[$ "NAME"]);
		ds_map_add(building_new,"OBJECT",building[$ "OBJECT"]);
		ds_map_add(building_new,"COST",building[$ "COST"]);
		
		var buildingtags = building[$ "TAGS"];
		var buildingtags_new = ds_list_create();
		for(var j=0;j<array_length(buildingtags);j++){
			ds_list_add(buildingtags_new,buildingtags[j]);
		}
		ds_map_add_list(building_new,"TAGS",buildingtags_new);
		
		if(variable_struct_exists(building,"ALTERNATIVE_SPRITE")){
			ds_map_add(building_new,"ALTERNATIVE_SPRITE",building[$ "ALTERNATIVE_SPRITE"]);
		}
		
		if(variable_struct_exists(building,"CREATE_VARIABLES")){
			var buildingcv =  building[$ "CREATE_VARIABLES"];
			var buildingcv_new = ds_map_create();
			var keys = variable_struct_get_names(buildingcv);
			for (var j = array_length(keys)-1; j >= 0; --j) {
			    var k = keys[j];
			    var v = buildingcv[$ k];
				ds_map_add(buildingcv_new,k,v);
			}
			ds_map_add(building_new,"CREATE_VARIABLES",buildingcv_new);
		}
		
		var buildingip = building[$ "INTERACTION_POSITIONS"];
		var buildingip_new = ds_map_create();
		ds_map_add(buildingip_new, "TOP", buildingip[$ "TOP"]);
		ds_map_add(buildingip_new, "LEFT", buildingip[$ "LEFT"]);
		ds_map_add(buildingip_new, "BOTTOM", buildingip[$ "BOTTOM"]);
		ds_map_add(buildingip_new, "RIGHT", buildingip[$ "RIGHT"]);
		ds_map_add_map(building_new,"INTERACTION_POSITIONS",buildingip_new);
		
		ds_list_add(building_list, building_new);
		ds_list_mark_as_map(building_list,ds_list_size(building_list)-1);
	}
	
	return building_list;
}

function getListOfUniqueBuildingTags(building_list){
	var tag_list = ds_list_create();
	
	for(var i=0;i<ds_list_size(building_list);i++){
		var building = ds_list_find_value(building_list,i);
		var tags = building[? "TAGS"];
		for(var j=0;j<ds_list_size(tags);j++){
			var tag = ds_list_find_value(tags,j);
			if(ds_list_find_index(tag_list,tag) == -1){
				ds_list_add(tag_list,tag);
			}
		}
	}
	
	return tag_list
}

function findBuildingByName(building_list,name){
	for(var i=0;i<ds_list_size(building_list);i++){
		var building = ds_list_find_value(building_list,i);
		if(building[? "NAME"] == name){
			return building;
		}
	}
	
	return undefined;
}

function findBuildingByObject(building_list,object){
	var object_name = object_get_name(object.object_index)
	for(var i=0;i<ds_list_size(building_list);i++){
		var building = ds_list_find_value(building_list,i);
		if(building[? "OBJECT"] == object_name){
			return building;
		}
	}
	
	return undefined;
}

function findBuildingsWithTag(building_list,tag){
	var buildings = ds_list_create();
	for(var i=0;i<ds_list_size(building_list);i++){
		var building = ds_list_find_value(building_list,i);
		var tags = building[? "TAGS"];
		if(ds_list_find_index(tags,tag) != -1){
			ds_list_add(buildings,building);
		}
	}
	
	return buildings;
}

function hasBuildingTag(building,tag){
	var tags = building[? "TAGS"];
	if(ds_list_find_index(tags,tag) != -1){
		return true;
	}
	return false;
}

//

function getHighestCashRehisterQueue(){
	var highest_value = 0;
	for(var i=0;i<instance_number(obj_cashregister);i++){
		var number = ds_list_size(instance_find(obj_cashregister,i).queue_customer);
		if(number > highest_value){
			highest_value = number;
		}
	}
	
	return highest_value;
}