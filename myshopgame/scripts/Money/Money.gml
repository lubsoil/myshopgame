// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function addMoney(amount,type){
	obj_game_run.user_money += amount;
	if(obj_game_run.money_usage_now[? type] = undefined)
	{
		ds_map_add(obj_game_run.money_usage_now,type,0);	
	}
	if(obj_game_run.money_usage_now[? "TOTAL"] = undefined)
	{
		ds_map_add(obj_game_run.money_usage_now,"TOTAL",0);	
	}
	obj_game_run.money_usage_now[? type]+=amount;
	obj_game_run.money_usage_now[? "TOTAL"]+=amount;
	
	
	//QUESTS ACTIONS
	for(var i=0;i<ds_list_size(obj_game_run.quests_list);i++)
	{
		var current_quests = ds_list_find_value(obj_game_run.quests_list,i);
					
		var current_quests_completed = current_quests[? "COMPLETED"];
		
		if(current_quests_completed == false){
			var current_quests_name = current_quests[? "NAME"];
				
			if(current_quests_name == "EARN_MONEY"){
				var current_quests_progress_required = current_quests[? "PROGRESS_REQUIRED"];
				//DODAWANIE WARUNKÓW
				current_quests[? "PROGRESS"] += amount;
				//WYKONANIE QUESTA
				if(current_quests[? "PROGRESS"] >= current_quests_progress_required){
					current_quests[? "COMPLETED"] = true;
					addMoney(round(0.1*current_quests_progress_required),"QUEST");
				}
							
			}
		}

	}
	
}

function removeMoney(amount,type){
	obj_game_run.user_money -= amount;
	if(obj_game_run.money_usage_now[? type] = undefined)
	{
		ds_map_add(obj_game_run.money_usage_now,type,0);	
	}
	if(obj_game_run.money_usage_now[? "TOTAL"] = undefined)
	{
		ds_map_add(obj_game_run.money_usage_now,"TOTAL",0);	
	}
	obj_game_run.money_usage_now[? type]-=amount;
	obj_game_run.money_usage_now[? "TOTAL"]-=amount;
}