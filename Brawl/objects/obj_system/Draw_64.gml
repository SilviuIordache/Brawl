/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player))
{
	/*
	draw_text(x + 40, y, "hsp: " + string(obj_player.hsp));
	draw_text(x + 40, y + 16, "vsp: " + string(obj_player.vsp));
	draw_text(x + 40, y + 32, "move_direction: " + string(obj_player.move_direction));
	draw_text(x + 40, y + 48, "p1_count: " + string(instance_number(obj_player_1)));
	draw_text(x + 40, y + 64, "p2_count: " + string(instance_number(obj_player_2)));
	draw_text(x + 40, y + 80, "p3_count: " + string(instance_number(obj_player_3)));
	draw_text(x + 40, y + 96, "p4_count: " + string(instance_number(obj_player_4)));
	*/
	//draw_text(x, y + 112, "p1_in_Air: " + string(string(obj_player_1.inAir)));
	
	//DRAW PLAYER LIVES
	var i;
	var j;
	
	for (i = 0; i < teams_count; i++)
	{
		var obj = asset_get_index("obj_player_" + string(i + 1));
		if (instance_exists(obj))
		{
			//RED PLAYER LIVES DRAW
			if (obj.player_no == 1)
			{
					draw_sprite_ext(spr_lives_red, 0, x - 76, y, 8, 8, 0, c_white, 1)
					draw_text_ext_transformed(x - 73, y + 40, "x" + string(player_lives_array[obj.player_no - 1]), 10, 100, 2, 2, 0)
			}
			//BLUE PLAYER LIVES DRAW
			if (obj.player_no == 2)
			{
					draw_sprite_ext(spr_lives_blue, 0, x + 1785, y, 8, 8, 0, c_white, 1)
					draw_text_ext_transformed(x + 1785, y + 40, "x" + string(player_lives_array[obj.player_no - 1]), 10, 100, 2, 2, 0)
			}	
			//GREEN PLAYER LIVES DRAW
			if (obj.player_no == 3)
			{
					draw_sprite_ext(spr_lives_green, 0, x - 76, y + 700 , 8, 8, 0, c_white, 1)
					draw_text_ext_transformed(x - 73, y + 750, "x" + string(player_lives_array[obj.player_no - 1]), 10, 100, 2, 2, 0)
			}
					
			//YELLOW PLAYER LIVES DRAW
			if (obj.player_no == 4)
			{
					draw_sprite_ext(spr_lives_yellow, 0, x + 1785, y + 700 , 8, 8, 0, c_white, 1)
					draw_text_ext_transformed(x + 1785, y + 750, "x" + string(player_lives_array[obj.player_no - 1]), 10, 100, 2, 2, 0)
			}
		}
	}
	
	//for (i = 0; i <= team_lives; i++)
	//{
	//	draw_sprite_ext(spr_lives_red, 0, x - 16, y + i * 48, 8, 8, 0, c_white, 1)
	//}
}