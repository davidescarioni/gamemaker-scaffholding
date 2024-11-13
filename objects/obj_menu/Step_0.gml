var _key_up = keyboard_check_pressed(vk_up);
var _key_down = keyboard_check_pressed(vk_down);
var _key_enter = keyboard_check_pressed(ord("Z"));

// Store number of options in current menu
options_length = array_length(options[menu_level])

if (_key_up) {
	pos-=1;
	audio_play_sound(snd_menu_move, 1, false)
}

if (_key_down) {
	pos+=1;
	audio_play_sound(snd_menu_move, 1, false)
}

pos = clamp(pos, 0, options_length-1)

if (_key_enter) {
	
	var _start_menu_level = menu_level
	
	switch (menu_level) {
		case 0:
			switch (pos) {
				case 0:
					room_goto_next();
					audio_play_sound(snd_menu_ok, 1, false)
					break;
				case 1:
					menu_level = 1;
					audio_play_sound(snd_menu_ok, 1, false)
					break;
				case 2:
					game_end()
					break;
			}
		break;
		
		case 1:
			switch (pos) {
				case 0:
					window_set_fullscreen(!window_get_fullscreen())
					audio_play_sound(snd_menu_ok, 1, false)
					break;
				case 1:
					break;
				case 2:
					break;
				case 3:
					break;
				case 4:
					menu_level = 0;
					audio_play_sound(snd_menu_back, 1, false)
					break;
			}
		break;
	}
	
	// Set position to 0 when change the menu
	if (_start_menu_level != menu_level) pos = 0;
	
	// Store number of options in current menu to avoid breaking the draw event
	options_length = array_length(options[menu_level])
}