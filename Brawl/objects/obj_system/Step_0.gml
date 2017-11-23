/// @description Insert description here
// You can write your code in this editor
var i = 0;

for (i = 0; i <= 1; i++)
{
	if (player_alive_array[i] == false)
	{
		var obj = asset_get_index("obj_player_" + string(i + 1));
		inst = instance_find(obj_player_spawner, irandom(instance_number(obj_player_spawner) - 1));
		instance_create_layer(inst.x, inst.y, 0, obj);
		player_alive_array[i] = true;
		
	}
}


if(keyboard_check(ord("R")))
{
	room_restart();
}
