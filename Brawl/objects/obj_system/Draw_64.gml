/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player))
{
	draw_text(x, y, "hsp: " + string(obj_player.hsp));
	draw_text(x, y + 16, "vsp: " + string(obj_player.vsp));
	draw_text(x, y + 32, "move_direction: " + string(obj_player.move_direction));
}