//GET INPUTS
if (custom_keys_set == false)
{
	key_left = keyboard_check(vk_left)
	key_right = keyboard_check(vk_right)
	key_jump = keyboard_check_pressed(vk_space)
	key_jump_rel = keyboard_check_released(vk_space)
}
else
{
	if (player_no == 4)
	{
		key_left = keyboard_check(vk_left)
		key_right = keyboard_check(vk_right)
		key_jump = keyboard_check_pressed(vk_up)
		key_jump_rel = keyboard_check_released(vk_up)
	}
	if (player_no == 3)
	{
		key_left = keyboard_check(ord("A"))
		key_right = keyboard_check(ord("D"))
		key_jump = keyboard_check_pressed(ord("W"))
		key_jump_rel = keyboard_check_released(ord("W"))
	}
	if (player_no == 1)
	{
		key_left = gamepad_axis_value(0, gp_axislh) < -game_pad_min_threshold
		key_right = gamepad_axis_value(0, gp_axislh) > game_pad_min_threshold
		key_jump = gamepad_button_check_pressed(0, gp_face1);
		key_jump_rel = gamepad_button_check_released(0, gp_face1);
	}
	if (player_no == 2)
	{
		key_left = gamepad_axis_value(1, gp_axislh) < -game_pad_min_threshold
		key_right = gamepad_axis_value(1, gp_axislh) > game_pad_min_threshold
		key_jump = gamepad_button_check_pressed(1, gp_face1);
		key_jump_rel = gamepad_button_check_released(1, gp_face1);
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
if (place_meeting(x, y + 1, obj_wall))
{
	inAir = false
	if (jumps_available < 2)
		jumps_available = 2
	if(key_jump)
	{
		vsp += jump_speed; //normal jumping
		inAir = true
		jumps_available -= 1;
	}
	else if (key_jump_rel && (vsp < jump_speed_min))
	{
		vsp = jump_speed_min //fine jumping
	}
}
else if ( (key_jump) && jumps_available > 0 ) //double-jumping
{
	vsp += second_jump_speed; 
	inAir = true
	jumps_available -= 1;
}

if (vsp < jump_speed)
	vsp = jump_speed



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

//COLLIDING WITH OPPONENTS
if ( collision_rectangle( x + 2, y - 2, x + 10, y, obj_player, true, false ))
{
	idd = collision_rectangle( x + 2, y - 2, x + 10, y, obj_player, true, false );
	if ((y - idd.y) <= 11)
	{
		if (player_no != idd.player_no)
		{
			idd.y -= vsp //mini jump after jumping on other player
			instance_create_layer(x + 6, y + 5, 0, obj_death_explosion);

			//just lost 1 unit
			obj_system.player_lost_live[other.player_no - 1] = true;
			
			//lost live
			//if (obj_system.player_lives_array[player_no - 1] > 0)
			//	obj_system.player_lives_array[player_no - 1] -= 1;
				
			//destroy itself
			instance_destroy()
		}
	}
	
}
