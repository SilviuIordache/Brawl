draw_self()
if (obj_system.AllPlayersSpawned == true)
{
	draw_sprite(asset_get_index("spr_hat_" + string (obj_system.player_hats[player_no - 1])), 0, x, y)
	//draw_text(x, y, string (obj_system.player_hats[player_no - 1]))
}
//draw_sprite( asset_get_index("spr_hat_4" + string(irandom(10) + 1)), 0, x, y )