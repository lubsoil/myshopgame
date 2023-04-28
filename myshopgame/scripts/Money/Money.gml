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