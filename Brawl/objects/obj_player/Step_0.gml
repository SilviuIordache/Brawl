if (custom_keys_set == false)
{
	key_left = keyboard_check(vk_left)
	key_right = keyboard_check(vk_right)
	key_jump = keyboard_check_pressed(vk_space)
	key_jump_rel = keyboard_check_released(vk_space)
}
else
{
	if (player_no == 1)
	{
		key_left = keyboard_check(vk_left)
		key_right = keyboard_check(vk_right)
		key_jump = keyboard_check_pressed(vk_up)
		key_jump_rel = keyboard_check_released(vk_up)
	}
	if (player_no == 2)
	{
		key_left = keyboard_check(ord("A"))
		key_right = keyboard_check(ord("D"))
		key_jump = keyboard_check_pressed(ord("W"))
		key_jump_rel = keyboard_check_released(ord("W"))
	}
}
//Calculate Movement
move_direction = key_right - key_left;

//GRAVITY
vsp += grv;
//------------------------------HORIZONTAL MOVEMENT-----------------------

hsp = move_speed * move_direction

//Horizontal Collision Checking
if (place_meeting(x + hsp, y, obj_wall))
{
	while (!place_meeting(x + sign(hsp), y, obj_wall))
	{
		x += sign(hsp)
	}
	hsp = 0;
}

//Normal horizontal movement
x += hsp;
//-----------------------------------------------------------------------------


//--------------------VERTICAL MOVEMENT----------------------------------------
//------------Jump Checking-------------------------------
if (place_meeting(x, y + 1, obj_wall) && key_jump)
{
	vsp += jump_speed; //normal jumping
}
else 
{
	if (key_jump_rel && (vsp < jump_speed_min))
	{
		vsp = jump_speed_min //fine jumping
	}
}

//Vertical Collision Checking
if (place_meeting(x, y + vsp, obj_wall))
{
	while (!place_meeting(x , y + sign(vsp), obj_wall))
	{
		y += sign(vsp)
	}
	vsp = 0;
}
y += vsp;
//------------------------------------------------------------------------------

if ( collision_rectangle( x, y - 2, x + 12, y, obj_player, true, false ))
{
	idd = collision_rectangle( x, y - 2, x + 12, y, obj_player, true, false );
	if ((y - idd.y) <= 11)
	{
		instance_create_layer(x + 6, y + 5, 0, obj_death_explosion);
		obj_system.player_alive_array[player_no - 1] = false;
		instance_destroy()
	}
}
