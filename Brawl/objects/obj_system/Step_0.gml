/// @description Insert description here
// You can write your code in this editor
var i = 0;
var j = 0;

//INITIAL SPAWNING
if (initial_spawning_done == false)
{
	for (i = 0; i < teams_count; i++)
	{
		//INITIALIZE HATS
		player_hats[i] = irandom(10) + 1
		var obj = asset_get_index("obj_player_" + string(i + 1));
		while (instance_number(obj) < player_per_team_count )
		{
			inst = instance_find(obj_player_spawner, irandom(instance_number(obj_player_spawner) - 1));
			if (inst.available = true)
			{
				instance_create_layer(inst.x, inst.y, 0, obj);
				inst.available = false
				inst.alarm[0] = 30
			}
		}
	}
	initial_spawning_done = true;
}

//SPAWNING POST-GAME START
for (i= 0; i < teams_count; i++)
{
	if ( (player_lost_live[i] == true) && (player_lives_array[i] > 0))
	{
		var obj = asset_get_index("obj_player_" + string(i + 1));
		inst = instance_find(obj_player_spawner, irandom(instance_number(obj_player_spawner) - 1));
		if (inst.available = true) //&& 
		//distance_to_object( instance_nearest(inst.x, inst.y, obj_player) ) > 20 )
		{
			instance_create_layer(inst.x, inst.y, 0, obj);
			inst.available = false
			inst.alarm[0] = 30
		}
		player_lost_live[i] = false;
		player_lives_array[i] -= 1;
	}
}

if (keyboard_check(ord("R")))
	room_restart()