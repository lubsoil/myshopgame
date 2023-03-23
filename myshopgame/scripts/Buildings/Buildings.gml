//FUNKCJA ŁADUJĄCA LISTĘ BUDYNKÓW (pod edycję)
function loadBuildingList(building_list = undefined){
	if(building_list != undefined){
		if(ds_exists(building_list,ds_type_list)){
			ds_list_destroy(building_list);
		}
	}
	building_list = loadJSONFile("buildings.json");
	
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