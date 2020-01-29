key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_up = keyboard_check(vk_up)or keyboard_check(ord("W"));
key_down = keyboard_check(vk_down)or keyboard_check(ord("S"));

//Calculate Movement//

//Right//

if (keyboard_check(vk_left) or keyboard_check(ord("A")))
{
		key_left = 2;
		direction = 2;
}
else
{
	key_left = 0;
}

//Left// 

if (keyboard_check(vk_right) or keyboard_check(ord("D")))
{
	key_right = 2;
	direction = 4;
}
else
{
	key_right = 0;
}

//Up//

if (keyboard_check(vk_up)or keyboard_check(ord("W")))
{
	key_up = -2;
	direction = 3;
}
else
{
	key_up = 0;
}

//Down//

if (keyboard_check(vk_down)or keyboard_check(ord("S")))
{
	key_down = -2;
	direction = 1;
}
else
{
	key_down = 0;
}

//Horizontal/Vertical Movement//

hsp = key_right - key_left;

vsp = key_up - key_down;

//Horizontal Collision//

if (place_meeting(x + hsp,y,o_Test_Wall))
{
	while (!place_meeting(x + sign(hsp),y,o_Test_Wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

//Vertical Collision//

if (place_meeting(x,y + vsp,o_Test_Wall))
{
	while (!place_meeting(x,y + sign(vsp),o_Test_Wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

x = x + hsp;

y = y + vsp;

// Walking Animation//

if (hsp + vsp != 0)
{
	image_speed = 1;
	if (direction == 1 and key_down = -2)
	{
		sprite_index = sHamble_ForwardWalk;
	}
	if (direction == 2 and key_left = 2)
	{
		sprite_index = sHamble_SidewaysWalk;
		image_xscale = -1;
	}
	if (direction == 3 and key_up = -2)
	{
		sprite_index = sHamble_Faceawaywalk;
	}
	if (direction == 4 and key_right = 2)
	{
		sprite_index = sHamble_SidewaysWalk;
		image_xscale = 1;
	}
}
else
{
		
	if (direction == 1)
	{
		sprite_index = sHamble_ForwardStand;
	}
	if (direction == 2)
	{
		sprite_index = sHamble_SidewaysStand;
		image_xscale = -1;
	}
	if (direction == 3)
	{
		sprite_index = sHamble_FaceawayStand;
	}
	if (direction == 4)
	{
		sprite_index = sHamble_SidewaysStand;
		image_xscale = 1;
	}
}

//Swing Normal Sword// 

if (hsp + vsp = 0 and mouse_check_button_pressed(mb_left))
{
	image_speed = 1;
	if (direction == 4)
	{
		
		sprite_index = sHamble_SidewaysSwing;
		image_xscale = 1;
		
	}
	if  (direction ==2)
	{
		
		sprite_index = sHamble_SidewaysSwing;
		image_xscale = -1;
		
	}
}